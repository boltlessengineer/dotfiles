if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source

    # Aliases
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

    # Exported Variables
    set -gx PATH ~/.local/bin $PATH

    if not set -q XDG_CONFIG_HOME
        set -gx XDG_CONFIG_HOME "$HOME/.config"
    end

    set -gx EDITOR nvim

    # set $TERM as wezterm to support undercurl in neovim (see wezterm#2505)
    if test "$TERM_PROGRAM" = WezTerm
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

    ## FZF
    set -gx FZF_DEFAULT_OPTS "--bind='ctrl-u:preview-half-page-up' \
--bind='ctrl-d:preview-half-page-down'"

    # brew shell completion (see: https://docs.brew.sh/Shell-Completion)
    if test -d (brew --prefix)"/share/fish/completions"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
    end
    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
end

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/boltless/.ghcup/bin

# pnpm
set -gx PNPM_HOME "/Users/boltless/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
