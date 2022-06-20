# My Neovim Config

```
neovim version : v0.7.0
```

## TODO

- [ ] Find why print `xterm-256color` on startup
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
