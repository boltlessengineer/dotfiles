local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  print('\'' .. client.name .. '\' languageserver started')
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- Formating
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- Add
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  protocol.make_client_capabilities()
)

-- Enable language servers
local servers = {'tsserver', 'gopls', 'vimls', 'sumneko_lua'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp.diagnosticls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		'markdown', 'css', 'scss', 'less', 'javascript', 'javascriptreact',
		'json', 'typescript', 'typescriptreact',
	},
	init_options = {
		linters = {
			eslint = {
				command = 'eslint', --'eslint_d',
				args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
				rootPatterns = {'.git'},
				debounce = 100,
				sourceName = 'eslint', --'eslint_d',
				parseJson = {
					errorsRoot = '[0].messages',
					line = 'line',
					column = 'column',
					endline = 'endLine',
					endColumn = 'endColumn',
					message = '[eslint] ${message} [${ruleId}]',
					security = 'severity',
				},
				securities = {
					[1] = 'error',
					[2] = 'warning',
				},
			},
		},
		filetypes = {
			javascript = 'eslint',
			javascriptreact = 'eslint',
			typescript = 'eslint',
			typescriptreact = 'eslint',
		},
		formatters = {
      eslint_d = {
        command = 'eslint_d',
        rootPatterns = {'.git'},
        args = {'--stdin', '--stdin-filename', '%filename', '--fix-to-stdout'},
      },
      -- TODO
      -- think just adding prettier in .eslintrc will be better
			prettier = {
				command = 'prettier',
				args = {'--stdin-filepath', '%filename', '--jsx-single-quote'},
				rootPatterns = {'.git'},
			},
		},
		formatFiletypes = {
			markdown = 'prettier',
			css = 'prettier',
			scss = 'prettier',
			less = 'prettier',
			javascript = 'prettier',
			javascriptreact = 'eslint_d',
			json = 'prettier',
			typescript = 'prettier',
			typescriptreact = 'eslint_d',
		},
	},
}

-- UI
-- TODO : replace lspsaga
--
--        https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
--        https://github.com/martinsione/dotfiles/blob/master/src/.config/nvim/lua/modules/config/nvim-lspconfig/ui.lua

local opts = {
  max_width = 120,
  focusable = false,
}
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, opts)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
  }
)

-- TODO:
-- setup only when ft=dart
require('flutter-tools').setup{}
