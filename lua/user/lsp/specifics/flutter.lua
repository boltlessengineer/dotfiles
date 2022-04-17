require("flutter-tools").setup {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  lsp = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
}
