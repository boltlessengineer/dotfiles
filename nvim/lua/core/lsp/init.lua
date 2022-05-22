local ok, _ = pcall(require, "lspconfig")
if not ok then return end

require("core.lsp.lsp-installer")
require("core.lsp.handlers").setup()
require("core.lsp.null-ls")

-- require("core.lsp.specifics.flutter")
