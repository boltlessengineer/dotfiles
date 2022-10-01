local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
  return
end

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
  },
  disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
  fast_wrap = {
    map = '<C-p>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    end_key = '$',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment',
  },
}

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
