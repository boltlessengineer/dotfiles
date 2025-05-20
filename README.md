# My dotfiles

## Installation

### Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew

```bash
xcode-select --install
```

2. Clone repo into new hidden directory

```bash
git clone https://github.com/boltlessengineer/dotfiles ~/.dotfiles
```

3. Create symlinks in the $HOME directory to the real files in the repo

```bash
# install fish config
ln -sf ./fish ~/.config/fish

# copy tmux config
ln -sf ./tmux.conf ~/.tmux.conf

# install lf config
ln -sf ./lf ~/.config/lf

# install wezterm config
ln -sf ./wezterm ~/.config/wezterm
# download wezterm terminfo file (see official FAQ)
tempfile=(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile
```

### install fish

```bash
# Install fish
brew install fish

# Add fish to /etc/shells
echo "$(where fish)" | sudo tee -a /etc/shells

# Change default shell to fish
chsh -s "$(where fish)"

# Run fish with --no-config
# Some programs should be installed first
fish --no-config

#

fisher update
```

### Install stuffs
```bash
# Neovim
brew install neovim --HEAD

# WezTerm
brew tap wez/wezterm
brew install --cask wez/wezterm/wezterm # or wez/wezterm/wezterm-nighly
```

# TODO

- [ ] Create shell script to check if local config already exists
- [ ] Test this in new Mac
- [ ] Add Brewfile
- [ ] Check this tool
  - [ ] [Schniz/fnm](https://github.com/Schniz/fnm)
        Rust based node.js version manager
