-- Tokyonight config

vim.g.tokyonight_style = 'night'
-- Add transparent in graphical applications
if vim.fn.expand('$TERM') ~= '' then
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_transparent_sidebar = true
end

local colorscheme = 'tokyonight'

-- Load the colorscheme
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

-- Additional highlights
-- TODO make PR about these
local c = require('tokyonight.colors').setup()
local util = require('tokyonight.util')
-- vim.highlight.link('TreesitterContext', 'CursorLine')
-- vim.highlight.link('TreesitterContextLineNumber', 'PmenuSel')
util.highlight('TreesitterContext', { bg = c.bg_highlight })
util.highlight('TreesitterContextLineNumber', { fg = c.comment, bg = c.bg_highlight })
util.highlight('IndentBlanklineChar', { fg = c.fg_gutter })
util.highlight('IndentBlanklineContextChar', { fg = c.dark5 })
