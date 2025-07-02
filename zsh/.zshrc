# Profile

bindkey -e

alias ll="ls -l"
alias la="ls -lA"
alias gs="git status"
alias ta="tmux attach"
alias nn="NVIM_APPNAME=nativevim nvim"

## Custom prompt
setopt prompt_subst
export PS1='%F{green}%n@%m %F{blue}%~%f${IN_NIX_SHELL:+ nix:($IN_NIX_SHELL)} %# '

## Editor
export EDITOR="$(command -v nvim || command -v vim)"

## Fzf shell integration
source <(fzf --zsh)

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
bindkey '^X^E' edit-command-line

if [[ -n "$IN_NIX_SHELL" ]]; then
    export SHELL=$(which zsh)
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section
