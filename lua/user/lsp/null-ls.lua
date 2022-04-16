-- null_ls vs diagnostic_ls
local ok, null_ls = pcall(require, "null-ls")
if not ok then return end

local b = null_ls.builtins

local eslintConfig = {
  condition = function(utils)
    return utils.root_has_file({ ".eslintrc.json" })
  end
}

null_ls.setup({
  debug = true,
  sources = {
    -- stylua (lua)
    -- > cargo install stylua
    b.formatting.stylua,

    -- eslint_d (js)
    -- > npm install -g eslint_d
    b.diagnostics.eslint.with(eslintConfig),
    b.code_actions.eslint.with(eslintConfig),

    -- prettier_d_slim (js)
    -- NOTE: why? : https://www.reddit.com/r/neovim/comments/mrep3l/comment/guuh1p1/?utm_source=share&utm_medium=web2x&context=3
    -- > npm install -g prettier_d_slim
    -- b.formatting.prettier_d_slim--[[ .with({
    --   extra_args = { '--no-semi', "--single-quote", "--jsx-single-quote" },
    -- }), ]]
    b.formatting.prettier.with({
      extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' }
    })
  },
  -- on_attach = function (client)
  -- if client.resolved_capabilities.document_formatting then
  --     vim.cmd([[
  --     augroup LspFormatting
  --       autocmd! * <buffer>
  --       autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
  --     augroup END
  --     ]])
  --   end
  -- end,
})
