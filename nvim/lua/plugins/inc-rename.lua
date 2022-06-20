local ok, inc = pcall(require, 'inc_rename')
if not ok then return end

inc.setup{
  cmd_name = 'IncRename',
  hl_group = 'Substitute',
  multifile_preview = true,
}
