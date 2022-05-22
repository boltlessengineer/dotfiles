local ok, _ = pcall(require, "lspconfig")
if not ok then return end

require("core.lsp.lsp-installer")
require("core.lsp.handlers").setup()
-- require("lsp.null-ls")

-- require("lsp.specifics.flutter")
