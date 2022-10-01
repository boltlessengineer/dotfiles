local ok, inc = pcall(require, 'inc_rename')
if not ok then return end

inc.setup {
  cmd_name = 'IncRename',
  hl_group = 'Substitute',
  preview_empty_name = false,
  show_message = true,
  input_buffer_type = nil,
  post_hook = nil,
}
