local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end

gitsigns.setup {
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  word_diff  = false,
}
