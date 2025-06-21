source "$HOME/projects/dotfiles/zsh/async.zsh"

# init zsh-async
async_init

jj_status() {
    template="' (' ++ change_id.shortest(8) ++ ')'"
    if repo_root=$(jj root --ignore-working-copy 2>/dev/null); then
        jj log -r @ -T $template --no-graph --no-pager --color never --ignore-working-copy -R $repo_root
    fi
}

fetch_data() {
    # refetch data
    date_string=$(date +"%Y-%m-%d %H:%M:%S")
    JJ_ST=$(jj_status)
}
reset_prompt() {
    # reset prompt
    PROMPT="%F{green}%n@%m %F{blue}%~%f$JJ_ST %# "
    # re-render prompt
    zle reset-prompt
}

RUNNING=
update_prompt() {
    if [[ -n $RUNNING ]]; then
        return 0
    fi
    RUNNING=1

    fetch_data

    reset_prompt

    # NOTE: don't make recursive loop. use TMOUT & TRAPALRM for 1s throttling
    # # call fetch job again
    # async_job prompt_worker
    RUNNING=
}

# define status_worker to run asynchronously
async_start_worker prompt_worker -n
async_register_callback prompt_worker update_prompt
async_job prompt_worker

# reset_prompt() {
#     # reset prompt
#     PROMPT="%F{green}%n@%m %F{blue}%~%f$JJ_ST %# "
#     # re-render prompt
#     zle reset-prompt
#
#     async_job prompt_render_worker
# }
# async_start_worker prompt_render_worker -n
# async_register_callback prompt_render_worker reset_prompt
# async_job prompt_render_worker

# call do_update on every seconds
TMOUT=1
TRAPALRM() {
    async_job prompt_worker
}

# NOTE: don't do heavy jobs here. It will make prompt slower
precmd() {
    PROMPT="%F{green}%n@%m %F{blue}%~%f$JJ_ST %# "
    # call fetch job again
    async_job prompt_worker
}

zle_reset_prompt_widget() {
    # async_job prompt_worker
}
# register it under the name “zle_reset_prompt_widget”
zle -N zle_reset_prompt_widget
autoload -Uz add-zle-hook-widget
add-zle-hook-widget line-init zle_reset_prompt_widget

PROMPT="%n@%m %~%f$JJ_ST %# "

# references:
# - https://medium.com/@henrebotha/how-to-write-an-asynchronous-zsh-prompt-b53e81720d32
# - https://void-shana.moe/posts/customize-your-zsh-prompt
