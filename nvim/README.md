# My Neovim Config

```
neovim version : v0.7.0
```

## Install / Uninstall

### Build & Install

```bash
xcode-select --Install
# install homebrew
brew install ninja libtool automake cmake pkg-config gettext curl

git clone https://github.com/neovim/neovim
cd neovim
# remove build files (when re-build)
rm -rf build .deps
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
# (now installed at `/usr/local`)
```

### Uninstall

```bash
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim
```

## TODO

- Things to learn

  - [ ] jumplist
  - [ ] operator
  - [ ] register
  - [ ] harpoon

- Things to add (or try)

  - [ ] fidget.nvim
  - [ ] nvim-base16

- Things to make

  - [ ] show buffer count on statusbar

- [ ] projects

  - [ ] nativeTerm.nvim
  - [ ] proTerm.nvim
  - [ ] inlinefold.nvim
    - hides html class names (like tailwindcss)
    - hides long texts (ex: urls) in markdown tables
    - inspired by "inlinefold" plugin for VSCode

- [ ] add fold whichkey(or ui.select) mappings. use `<C-f>`
- [ ] remove numberline in vertical terminal like trouble.nvim
- [ ] mark opened buffers in file tree || make sidebar plugin to show buffer lists
- [ ] ignore help files in `Telescope oldfiles` (`<space>fr`)
- [x] Find why print `xterm-256color` on startup
- [ ] fix notify.nvim word wrap issue
- [ ] better ts-parser & LSP for MarkDown
- [ ] Find way to run multiple lua commands
- [ ] sumneko/lua-language-server EmmyLua-Annotiations error at

      ```
      {
        new: function, <- reason (function defined another place)
        on_close: fun(term: Terminal),
      } <- highlight error here
      ```

      check : [sumneko/lua-language-server](https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Annotations)

- [ ] Toggle inline comment in INSERT mode
- [ ] give more width to `Telescope help_tags` preview
- [x] add `smjonas/inc-rename.nvim`
- [ ] show where I can jump with `<C-o>` (jumplist?)
- [x] `go_to_next_hunk` feature
- [ ] markdown preview with image previewer (w3img, imgcat...)
- [ ] don't create comment automatically when `<S-CR>` in INSERT mode
- [ ] add shortcut to start edit on next function's param space (`myfunc (|)`)
- [ ] NeoTerm.nvim
  - [ ] Open Terminal & save bufnr to global variable
    - [ ] Right | Bottom | Left | (maybe Top..?)
    - [ ] **Float**
  - [ ] Bufnr ignore (Bufline... check toggleterm)
  - [ ] Switch Terminal
  - [ ] Send message to other terminal buffer
  - [ ] Provide all these with lua functions
- [ ] plugin to edit register easily <https://www.youtube.com/watch?v=I5QGlfbuCfs>
