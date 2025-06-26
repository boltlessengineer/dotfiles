export PATH=$HOME/.local/bin:$PATH

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# bob-nvim
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH

# bun
export BUN_INSTALL=$HONE/.bun
export PATH=$BUN_INSTALL/bin:$PATH

# luarocks
## set LUA_PATH and LUA_CPATH
command -v luarocks &> /dev/null && eval $(luarocks path --no-bin)
## set PATH
export PATH=$HOME/.luarocks/bin:$PATH

# janet / jpm
export JANET_TREE=$HOME/.jpm

# HACK: python binary path. honestly I don't like this hard-coded method
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

export PATH="$HOME/dot/bin:$PATH"



################ BOTTOM ################
# load .zshrc when interactive (ssh)
[[ -o interactive ]] && source ~/.zshrc
