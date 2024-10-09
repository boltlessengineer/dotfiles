# Profile

bindkey -e

alias l="ls"
alias ls="exa"
alias lt="exa -T"
alias lT="exa -Tlh --no-user --no-time"
alias ll="exa -lh --no-user"
alias la="exa -lha --git --no-user"
alias nv="foreground_nvim"
alias gs="git status"
alias gb="git checkout"
alias gr="gh repo clone"
alias glz="lazygit"
alias rvim="NVIM_APPNAME=nvim_rocks nvim"
alias nn="NVIM_APPNAME=nativevim nvim"

## Exported Variables
export PS1='%F{green}%n@%m %F{blue}%~%f %# '

export PATH=$HOME/.local/bin:$PATH

export EDITOR=vim

## Rust
export PATH=$PATH:$HOME/.cargo/bin

# bob-nvim
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH

export BUN_INSTALL=$HONE/.bun
export PATH=$BUN_INSTALL/bin:$PATH

### luarocks
#### set LUA_PATH and LUA_CPATH
command -v luarocks &> /dev/null && eval $(luarocks path --no-bin)
## set PATH
export PATH=$HOME/.luarocks/bin:$PATH

## Fzf shell integration
source <(fzf --zsh)
