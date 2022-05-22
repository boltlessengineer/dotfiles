if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
  zoxide init fish | source

  # Aliases
  alias ls="exa"
  alias lt="exa -T"
  alias lT="exa -Tlh --no-user --no-time"
  alias ll="exa -lh --no-user"
  alias la="exa -lha --git --no-user"

  # Exported Variables
  set -gx PATH ~/.local/bin $PATH

  ## Go
  set -gx GOROOT "$(brew --prefix golang)/libexec"
  set -gx GOPATH $HOME/go
  set -gx PATH $PATH $GOROOT/bin $GOPATH/bin

  ## Flutter
  set -gx PATH $PATH "/opt/homebrew/Caskroom/flutter/2.10.4/flutter/bin"
end
