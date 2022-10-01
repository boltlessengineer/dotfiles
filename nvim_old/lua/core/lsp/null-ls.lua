-- null_ls vs diagnostic_ls
local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

local b = null_ls.builtins

local eslintConfig = {
  condition = function(utils)
    return utils.root_has_file({ '.eslintrc.json' })
  end,
}

null_ls.setup({
  debug = true,
  sources = {
    -- stylua (lua)
    -- > cargo install stylua
    -- > brew install stylua
    -- b.formatting.stylua,

    -- eslint_d (js)
    -- > npm install -g eslint_d
    b.diagnostics.eslint_d.with(eslintConfig),
    b.code_actions.eslint_d.with(eslintConfig),

    -- prettierd
    -- > npm install -g @fsouza/prettierd
    b.formatting.prettierd.with({
      -- TODO: create default prettierrc.json
      -- env = {
      --   PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.config/nvim/~~~/.prettierrc.json'),
      -- },
    }),
  },
  on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = false })
    -- TODO: organize augroups as lua module ('core.augroups')
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
          -- (null-ls formatting should be notified exactly)
        end
      })
    end
  end
})
