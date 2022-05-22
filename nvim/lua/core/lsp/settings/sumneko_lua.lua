return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          -- [vim.fn.stdpath("config") .. "/lua"] = true,
          -- NOTE: https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html#some-lsp-client-configurations
        },
      },
    },
  },
}
