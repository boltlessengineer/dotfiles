local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then return end

local dashboard = require 'alpha.themes.dashboard'
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  dashboard.button('e', '  > New file', ':enew <BAR> startinsert <CR>'),
  dashboard.button('f', '  > Find file', ':Telescope find_files <CR>'),
  dashboard.button('r', '  > Recent files', ':Telescope oldfiles <CR>'),
  dashboard.button('c', '  > Config', ':cd ~/.config/nvim <BAR> e ./init.lua <CR>'),
  dashboard.button('p', '  > Update plugins', ':PackerSync <CR>'),
  dashboard.button('q', '  > Quit', ':qa <CR>'),
}

dashboard.section.footer.val = function()
  return 'boltlessengieer.tistory.com'
end

vim.api.nvim_create_augroup('alpha_tabline', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'alpha_tabline',
  pattern = 'alpha',
  command = 'set showtabline=0 laststatus=0 noruler',
})
vim.api.nvim_create_autocmd('FileType', {
  group = 'alpha_tabline',
  pattern = 'alpha',
  callback = function()
    vim.api.nvim_create_autocmd('BufUnload', {
      group = 'alpha_tabline',
      buffer = 0,
      command = 'set showtabline=2 laststatus=3 ruler'
    })
  end
})

-- dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
