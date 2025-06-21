# Profile

bindkey -e

alias ll="ls -l"
alias la="ls -lA"
alias gs="git status"
alias ta="tmux attach"
alias nn="NVIM_APPNAME=nativevim nvim"

## Custom prompt
export PROMPT='%F{green}%n@%m %F{blue}%~%f %# '

## Custom prompt (with asychronous rich data rendering)
source "$HOME/projects/dotfiles/zsh/prompt.zsh"

## Editor
export EDITOR="$(command -v nvim || command -v vim)"

## Fzf shell integration
source <(fzf --zsh)

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
bindkey '^X^E' edit-command-line
