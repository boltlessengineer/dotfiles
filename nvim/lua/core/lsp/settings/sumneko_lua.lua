-- NOTE: https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html#some-lsp-client-configurations

return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        -- NOTE: diable `different-requires` to hide warnings
        -- https://www.reddit.com/r/neovim/comments/rvc4vo/annoying_lua_warning/
        -- https://www.reddit.com/r/neovim/comments/snmkr3/comment/hw6diw9/
        disable = { 'different-requires' },
        globals = { 'vim' },
      },
      format = {
        -- NOTE: refer these for configuration documents.
        -- https://github.com/sumneko/lua-language-server/wiki/Code-Formatter
        -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
        defaultConfig = {
          quote_style = 'single',
        },
      },
      workspace = {
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
        },
      },
    },
  },
}
