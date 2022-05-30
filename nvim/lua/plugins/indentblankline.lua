local ok, indent = pcall(require, "indent_blankline")
if not ok then
  vim.notify("no indent_backline")
  return
end

indent.setup {
  show_current_context = true,
  -- show_current_context_start = true,
}
