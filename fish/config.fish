if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
  zoxide init fish | source

  # Aliases
  alias l="exa"
  alias lt="exa -T"
  alias lT="exa -Tlh --no-user --no-time"
  alias ll="exa -lh --no-user"
  alias la="exa -lha --git --no-user"
  alias nv="foreground_nvim"
  alias gr="gh repo clone"

  # Exported Variables
  set -gx PATH ~/.local/bin $PATH

  set -gx EDITOR nvim

  # set $TERM as wezterm to support undercurl in neovim (see wezterm#2505)
  if test "$TERM_PROGRAM" = "WezTerm"
    set -gx TERM wezterm
  end

  ## Go
  set -gx GOROOT "$(brew --prefix golang)/libexec"
  set -gx GOPATH $HOME/go
  set -gx PATH $PATH $GOROOT/bin $GOPATH/bin

  ## Flutter
  set -gx PATH $PATH /opt/homebrew/Caskroom/flutter/2.10.4/flutter/bin

  ## Rust
  set -gx PATH $PATH $HOME/.cargo/bin
end
