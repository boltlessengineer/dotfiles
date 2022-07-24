-- Tokyonight config

vim.g.tokyonight_style = 'night'
-- Add transparent in graphical applications
if vim.fn.expand('$TERM') ~= '' then
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_transparent_sidebar = false
end

local colorscheme = 'tokyonight'

-- Load the colorscheme
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

-- Additional highlights
-- TODO: make PR about these
local c = require('tokyonight.colors').setup()
local util = require('tokyonight.util')
-- vim.highlight.link('TreesitterContext', 'CursorLine')
-- vim.highlight.link('TreesitterContextLineNumber', 'PmenuSel')
util.highlight('TreesitterContext', { bg = c.bg_highlight })
util.highlight('TreesitterContextLineNumber', { fg = c.comment, bg = c.bg_highlight })
util.highlight('IndentBlanklineChar', { fg = c.fg_gutter })
util.highlight('IndentBlanklineContextChar', { fg = c.dark5 })
util.highlight('NavicText', { fg = c.dark5 })
util.highlight('NavicSeparator', { fg = c.fg_gutter })
util.highlight('NvimTreeWinSeparator', { bg = c.bg_sidebar })
local items = {
  'File',
  'Module',
  'Namespace',
  'Package',
  'Class',
  'Method',
  'Property',
  'Field',
  'Constructor',
  'Enum',
  'Interface',
  'Function',
  'Variable',
  'Constant',
  'String',
  'Number',
  'Boolean',
  'Array',
  'Object',
  'Key',
  'Null',
  'EnumMember',
  'Struct',
  'Event',
  'Operator',
  'TypeParameter',
}
for _, item in pairs(items) do
  vim.cmd('hi link NavicIcons' .. item .. ' CmpItemKind' .. item)
end
