-- use nvim-gps if lsp['documentSymbols'] is not supported
local M = {}

local n_ok, navic = pcall(require, 'nvim-navic')
if n_ok then
  navic.setup {
    highlight = true,
    separator = ' > ',
  }
end

local n_gps = require 'nvim-gps'
n_gps.setup()

---filename with icon based on filetype
M.filename = function()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.expand('%:e')

  if filename == '' then
    return
  end

  local ok, devicons = pcall(require, 'nvim-web-devicons')
  if not ok then
    return
  end
  extension = extension ~= '' and extension or vim.bo.filetype
  local ft_icon, ft_icon_hl_group = devicons.get_icon(filename, extension, { default = true })
  return ' ' .. '%#' .. ft_icon_hl_group .. '#' .. ft_icon .. '%* %#CursorLineNr#' .. filename .. '%*'
end

M.gps = function()
  if navic.is_available() then
    -- vim.schedule(function()
    --   vim.notify('use navic')
    -- end)
    return navic.get_location()
  elseif n_gps.is_available() then
    -- vim.schedule(function()
    --   vim.notify('use gps')
    -- end)
    return n_gps.get_location()
  end
end

M.filetype_exclude = {
  'alpha',
  'help',
  'NvimTree',
  'neogitstatus',
  'packer',
  'Trouble',
  'Telescope',
  'Whichkey',
}

M.get_winbar = function()
  if vim.bo.buftype == 'terminal' then
    return ''
  end
  if vim.tbl_contains(M.filetype_exclude, vim.bo.filetype) then
    return ''
  end
  return table.concat({
    M.filename(),
    M.gps(),
  }, ' %#LineNr#' .. '>' .. '%* ')
end

return M
