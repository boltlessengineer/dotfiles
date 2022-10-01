local ok, notify = pcall(require, 'notify')
if not ok then
  return
end

local renderers = require('notify.render')

notify.setup {
  background_colour = 'NormalFloat',
  fps = 30,
  icons = {
    DEBUG = '',
    ERROR = '',
    INFO = '',
    TRACE = '✎',
    WARN = ''
  },
  level = 2,
  minimum_width = 50,
  max_width = 70,
  render = function(bufnr, notif, highlights, config)
    if notif.title[1] == '' then
      return renderers.minimal(bufnr, notif, highlights, config)
    else
      return renderers.default(bufnr, notif, highlights, config)
    end
  end,
  stages = 'fade_in_slide_out',
  timeout = 1500,
}

-- KEYMAPS
-- clear all
vim.keymap.set('n', '<ESC>', function()
  require('notify').dismiss() -- dismiss notifications
  vim.cmd([[noh]]) -- remove search highlights
  vim.cmd([[echon]]) -- clear cmdline
end)
-- show past notifications
-- vim.keymap.set('n', '+', '<cmd>Notifications<CR>')

vim.notify = notify
