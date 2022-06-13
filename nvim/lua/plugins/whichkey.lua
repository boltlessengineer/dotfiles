local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then return end

which_key.setup({
  plugins = {
    presets = {
      operators = true,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = true,
      g = false,
    },
  },
  key_labels = {
    ['<leader>'] = 'SPC',
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  ignore_missing = true,
})

local default_opts = {
  mode    = 'n',
  prefix  = '<leader>',
  buffer  = nil,
  silent  = true,
  noremap = true,
  nowait  = true,
}

local function newopts(...)
  return vim.tbl_deep_extend('force', default_opts, ...)
end

local mappings = {
  ['0'] = { 'Select Next Parameter' },
  ['9'] = { 'Select Prev Parameter' },

  a = { '<cmd>Alpha<CR>', 'Alpha' },
  b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
  f = {
    name = 'File',
    f = { '<cmd>Telescope find_files<CR>', 'Find in CWD' },
    g = { '<cmd>Telescope live_grep<CR>', 'Live Grep' },
    r = { '<cmd>Telescope oldfiles<CR>', 'Recent' },
    t = { '<cmd>NvimTreeToggle<CR>', 'Toggle NvimTree' }
  },
  g = {
    name = 'Git',
    -- TODO: add way to go-to-next-git-block
    j = { '<cmd>lua vim.notify("some way to go-to-next-git-block")<CR>', 'Go To Next Change' },
    s = { '<cmd>Telescope git_status<CR>', 'Status' },
    d = { '<cmd>DiffviewOpen<CR>', 'Diff view' },
    l = { '<cmd>lua _Lazygit_toggle()<CR>', 'LazyGit' },
  },
  l = {
    name = 'Lsp',
    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
    d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Definition' },
    D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration' },
    f = { '<cmd>lua vim.lsp.buf.format()<CR>', 'Format this file' },
    F = { "<cmd>lua require('core.lsp.handlers').toggle_format_on_save()<CR>", 'Toggle AutoFormat' },
    I = { '<cmd>LspInstallInfo<CR>', 'Installer Info' },
    i = { '<cmd>LspInfo<CR>', 'Info' },
    j = {
      '<cmd>lua vim.diagnostic.goto_next()<CR>',
      'Next Diagnostic',
    },
    k = {
      '<cmd>lua vim.diagnostic.goto_prev()<CR>',
      'Prev Diagnostic',
    },
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
    -- TODO: add trouble.nvim toggle here
    t = { 'Trouble.nvim' }
  },
  q = { '<cmd>bdelete<CR>', 'Quit Buffer' },
  ['<leader>'] = {
    name = 'Terminal',
    ['1'] = { '<cmd>1ToggleTerm<CR>', '1' },
    ['2'] = { '<cmd>2ToggleTerm<CR>', '2' },
    ['3'] = { '<cmd>3ToggleTerm<CR>', '3' },
    ['4'] = { '<cmd>4ToggleTerm<CR>', '4' },
    f = { '<cmd>ToggleTerm direction=float<CR>', 'Float Terminal' },
  },
}

local term_opts_n = newopts({ prefix = [[<C-;>]] })

-- TODO: avoid `"+` typing in terminal-mode
local term_mappings = {
  ['1'] = { [[<cmd>1ToggleTerm<CR>]], '1' },
  ['2'] = { [[<cmd>2ToggleTerm<CR>]], '2' },
  ['3'] = { [[<cmd>3ToggleTerm<CR>]], '3' },
  ['4'] = { [[<cmd>4ToggleTerm<CR>]], '4' },
}

which_key.register(mappings, default_opts)
which_key.register(term_mappings, term_opts_n)
