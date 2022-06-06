-- NOTE: https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html#some-lsp-client-configurations

return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        -- NOTE: diable `different-requires` to hide warnings
        -- https://www.reddit.com/r/neovim/comments/rvc4vo/annoying_lua_warning/
        -- https://www.reddit.com/r/neovim/comments/snmkr3/comment/hw6diw9/
        disable = { "different-requires" },
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
        },
      },
    },
  },
}
