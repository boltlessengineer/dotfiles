-- Tokyonight config
vim.g.tokyonight_style = "night"

local colorscheme = "tokyonight"

-- Load the colorscheme
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
