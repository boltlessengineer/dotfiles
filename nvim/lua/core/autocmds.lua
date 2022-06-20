vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'term://*',
  callback = function()
    print('BufEnter')
    vim.api.nvim_win_set_option(0, 'number', false)
    vim.api.nvim_win_set_option(0, 'relativenumber', false)
    vim.api.nvim_win_set_option(0, 'cursorline', false)
  end
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*lazygit*',
  callback = function()
    print('New Terminal')
    vim.cmd [[startinsert!]]
  end
})
