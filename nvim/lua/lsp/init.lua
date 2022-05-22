local ok, _ = pcall(require, "lspconfig")
if not ok then return end

require("lsp.lsp-installer")
require("lsp.handlers").setup()
require("lsp.null-ls")

-- require("lsp.specifics.flutter")
