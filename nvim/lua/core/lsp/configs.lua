-- Install loved servers
local servers = {
  'clangd',
  'gopls',
  'jsonls',
  'sumneko_lua',
  'tailwindcss',
  'tsserver',
  'html',
}

local installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if installer_ok then
  lsp_installer.setup {
    ensure_installed = servers,
  }
end

local lspconfig = require('lspconfig')

for _, server in pairs(servers) do
  local opts = {
    on_attach = require('core.lsp.handlers').on_attach,
    capabilities = require('core.lsp.handlers').capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, 'core.lsp.settings.' .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend('force', server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
