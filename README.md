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
# install neovim config
ln -shf ./nvim ~/.config/nvim

# install fish config
ln -shf ./fish ~/.config/fish

# install lf config
ln -shf ./lf ~/.config/lf
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

# TODO

- [ ] Test this in new Mac
- [ ] Add Brewfile
