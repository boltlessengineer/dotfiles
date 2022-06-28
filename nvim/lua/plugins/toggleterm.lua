local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  return
end

local Terminal = require('toggleterm.terminal').Terminal

function _Lazygit_toggle()
  local lazygit = Terminal:new({
    cmd       = 'lazygit',
    hidden    = true, -- whether or not to include this terminal in the terminals list
    dir       = 'git_dir',
    direction = 'tab',
    on_open   = function()
      -- Don't use general on_open function defined below
    end,
  })
  lazygit:toggle()
end

local files = {
  c   = { 'gcc -o temp ', ' && ./temp && rm ./temp' },
  cpp = { 'g++ -o temp ', ' && ./temp && rm ./temp' },
}
local function Runfile()
  -- vim.cmd [[w]]
  local cmds = files[vim.bo.filetype]
  local command = cmds[1] .. vim.fn.expand('%:t') .. cmds[2]
  if command ~= nil then
    Terminal
        :new({ cmd = command, close_on_exit = false })
        :toggle()
    print('Running: ' .. command)
  end
end

-- KEYMAPS
vim.keymap.set('n', '<leader><leader>r', Runfile)
vim.keymap.set('n', '<F11>', Runfile)

toggleterm.setup {
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t>]],
  on_open = function(term)
    local opts = { buffer = term.bufnr }
    -- KEYMAPS
    -- Fast enter NORMAL mode
    vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  end,
  start_in_insert = false,
  insert_mappings = false,
  float_opts = {
    border = 'curved',
  },
}
