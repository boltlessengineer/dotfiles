-- Tokyonight config

vim.g.tokyonight_style = "night"
-- Add transparent in graphical applications
if vim.cmd("echo $TERM") ~= "" then
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_transparent_sidebar = true
end

local colorscheme = "tokyonight"

-- Load the colorscheme
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
