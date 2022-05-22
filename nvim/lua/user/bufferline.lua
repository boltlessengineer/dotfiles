local ok, bufferline =pcall(require, "bufferline")
if not ok then return end

bufferline.setup {
  options = {
    numbers = "none",
    close_command = "Bdelete! %d",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = false, -- | "nvim_lsp" | "coc"
    diagnostics_update_in_insert = false,
    offsets = {{ filetype = "NvimTree", text = "" }},
    separator_style = "thin", -- | "thick" | "slant" | { 'any', 'any' }
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'relative_directory',
  }
}
