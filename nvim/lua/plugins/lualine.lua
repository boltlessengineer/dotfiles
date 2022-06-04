local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

-- TODO: Terminal mode specific statusline
--       Customizable, well-documented alternative
--       : rebelot/heirline.nvim

-- TODO: LSP progress message
--       check : nvim-lua/lsp-status.nvim

lualine.setup {
  options = {
    disabled_filetypes = { "alpha", "dashboard" },
    globalstatus = true,
  },
  sections = {
    lualine_x = {
      "encoding",
      { "fileformat", icons_enabled = false },
      "filetype",
    },
  },
}
