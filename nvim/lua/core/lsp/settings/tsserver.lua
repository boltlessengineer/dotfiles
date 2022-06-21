-- local ts_utils = require("nvim-lsp-ts-utils")
local h = require('core.lsp.handlers')

return {
  filetypes = {
    'javascript', 'javascriptreact', 'javascript.jsx',
    'typescript', 'typescriptreact', 'typescript.tsx'
  },
  on_attach = function(client, bufnr)
    -- TODO: enable ts_utils
    -- ts_utils.setup({})
    -- ts_utils.setup_client(client)

    h.on_attach(client, bufnr)
  end
}
