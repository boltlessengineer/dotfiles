local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

require('lspsaga').init_lsp_saga {
  -- hide bulb (code action icon)
  code_action_icon = '',
  code_action_prompt = {
    sign = false,
  },
  border_style = 'round',
}

local opts = { noremap=true, silent=true }
--vim.api.nvim_set_keymap('n', 'J', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
--vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
--vim.api.nvim_set_keymap('n', '<CS-j>', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- TODO : doesn't render markdown properly.
--        ex) tsserver with styled-components plugin
--vim.api.nvim_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)
vim.api.nvim_set_keymap('n', 'ga', '<cmd>Lspsaga code_action<CR>', opts)
