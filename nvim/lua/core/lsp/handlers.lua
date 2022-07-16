local M = {}

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  vim.diagnostic.config({
    -- enable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
    local status_ok, illuminate = pcall(require, 'illuminate')
    if not status_ok then
      return
    end
    illuminate.on_attach(client)
  end
end

local function lsp_keymaps(bufnr)
  -- TODO: change this to vim.keymap.set()
  local opts = { noremap = true, silent = true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- TODO: <C-k> to <C-/>
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

local augroup = vim.api.nvim_create_augroup('LspAutoFormat', {})

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
  local ok, navic = pcall(require, 'nvim-navic')
  if ok and client.supports_method('textDocument/documentSymbol') then
    if client.name ~= 'html' then
      -- TODO: html-ls doesn't suppot documentSymbol
      -- https://github.com/microsoft/vscode-html-languageservice/issues/130
      navic.attach(client, bufnr)
    end
  end
  -- Setup AutoFormat
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(c)
            return c.name ~= 'tsserver'
          end,
          -- TODO: need callback to print `Auto-formatted with ~ server`
          --       (null-ls formatting should be notified exactly)
        })
      end
    })
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then return end
-- TODO: `return M end` to use neovim's default omnifunc

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
