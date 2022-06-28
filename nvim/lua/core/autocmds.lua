vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter' }, {
  pattern = 'term://*',
  callback = function(opts)
    vim.api.nvim_buf_set_option(opts.buf, 'bufhidden', 'wipe')
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.cmd [[startinsert]]
  end
})

vim.api.nvim_create_user_command('Vterm', function()
  vim.cmd [[split]]
  vim.cmd [[term]]
end, {})
