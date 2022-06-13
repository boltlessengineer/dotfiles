vim.api.nvim_create_autocmd({"BufWinEnter", "WinEnter"}, {
  pattern = "term://*",
  callback = function ()
    vim.schedule(function ()
      vim.cmd[[startinsert!]]
    end)
  end
})
