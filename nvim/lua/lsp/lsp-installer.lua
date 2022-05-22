local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then return end

-- Install loved servers
local servers = { "sumneko_lua", "gopls", "tailwindcss", "tsserver" }
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    server:install()
  end
end

-- TODO: turn off formatting in htmlls & cssls

-- Register a handler that will be called for all installed servers.
-- Or register handlers on specific server instances.
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }

  -- if server.name == "jsonls" then
  --   local jsonls_opts = require("lsp.settings.jsonls")
  --   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  -- end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", opts, sumneko_opts)
  end

  if server.name == "tsserver" then
    local tsserver_opts = require("lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", opts, tsserver_opts)
  end

  -- TODO: Remove diagnosticls settings
  if server.name == "diagnosticls" then
    local diagnostics_opts = require("lsp.settings.diagnosticls")
    opts = vim.tbl_deep_extend("force", diagnostics_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
