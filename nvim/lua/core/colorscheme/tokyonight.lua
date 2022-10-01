-- Tokyonight config

require('tokyonight').setup({
  style = 'night',
  transparent = false,
  -- TODO: override colors
  on_colors = function(c)
    -- example:
    -- c.error = '#ff0000'
  end,
  -- TODO: override highlights
  on_highlights = function(hl, c)
    hl.TreesitterContext = {
      bg = c.bg_highlight,
    }
    hl.TreesitterContextLineNumber = {
      fg = c.comment,
      bg = c.bg_highlight,
    }
    hl.IndentBlanklineChar = {
      fg = c.fg_gutter,
    }
    hl.IndentBlanklineContextChar = {
      fg = c.dark5,
    }
    hl.NavicText = {
      fg = c.dark5,
    }
    hl.NavicSeparator = {
      fg = c.fg_gutter,
    }
    hl.NvimTreeWinSeparator = {
      fg = c.bg_sidebar,
      bg = c.bg_sidebar,
    }
  end,
})

local colorscheme = 'tokyonight'

-- Load the colorscheme
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

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
