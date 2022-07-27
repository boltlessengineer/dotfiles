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
  [';'] = { '<cmd>Telescope commands<CR>', 'Commands' },

  a = { '<cmd>Alpha<CR>', 'Alpha' },
  b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
  f = {
    name = 'File',
    f = { '<cmd>Telescope find_files<CR>', 'Find in CWD' },
    g = { '<cmd>Telescope live_grep<CR>', 'Live Grep' },
    l = { '<cmd>NvimTreeToggle<CR>', 'Toggle NvimTree' },
    r = { '<cmd>Telescope oldfiles<CR>', 'Recent' },
  },
  g = {
    name = 'Git',
    -- TODO: add way to go-to-next-git-block
    j = { '<cmd>Gitsigns next_hunk<CR>', 'Go To Next Hunk' },
    k = { '<cmd>Gitsigns prev_hunk<CR>', 'Go To Prev Hunk' },
    s = { '<cmd>Telescope git_status<CR>', 'Status' },
    d = { '<cmd>DiffviewOpen<CR>', 'Diff view' },
    l = { '<cmd>lua _Lazygit_toggle()<CR>', 'LazyGit' },
  },
  h = { '<cmd>Telescope help_tags<CR>', ':help' },
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
    r = { vim.lsp.buf.rename, 'Rename' },
    w = { '<cmd>TroubleToggle workspace_diagnostics<CR>', 'Workspace Diagnostics' },
  },
  q = { '<cmd>close<CR>', 'Close Window' },
  ['<leader>'] = {
    name = 'Terminal',
    ['1'] = { '<cmd>1ToggleTerm<CR>', '1' },
    ['2'] = { '<cmd>2ToggleTerm<CR>', '2' },
    ['3'] = { '<cmd>3ToggleTerm<CR>', '3' },
    ['4'] = { '<cmd>4ToggleTerm<CR>', '4' },
    f = { '<cmd>ToggleTerm direction=float<CR>', 'Float Terminal' },
  },
  -- TODO: delete buffer if bufnr(0) is -1 or it is last window(except NvimTree, Trouble, ...) istead of closing window
  q = { 'Close Window' },
  t = {
    name = 'Trouble',
    w = { '<cmd>TroubleToggle workspace_diagnostics<CR>', 'Workspace Diagnostics' },
    r = { '<cmd>TroubleToggle lsp_references<CR>', 'LSP References' },
    -- d = { '<cmd>TroubleToggle lsp_definitions<CR>', 'LSP Definitions' },
    q = { '<cmd>TroubleToggle quickfix<CR>', 'Quickfix Items' },
    l = { '<cmd>TroubleToggle loclist<CR>', 'Location List' },
    t = { '<cmd>TodoTrouble<CR>', 'Todo List' },
  },
}

local term_opts_n = newopts({ prefix = [[<C-;>]] })

-- TODO: avoid `"+` typing in terminal-mode
local term_mappings = {
  ['1'] = { '<cmd>1ToggleTerm<CR>', 'Terminal id : 1' },
  ['2'] = { '<cmd>2ToggleTerm<CR>', 'Terminal id : 2' },
  ['3'] = { '<cmd>3ToggleTerm<CR>', 'Terminal id : 3' },
  ['4'] = { '<cmd>4ToggleTerm<CR>', 'Terminal id : 4' },
  a     = { '<cmd>ToggleTermToggleAll<CR>', 'Toggle All Terminals' },
  f     = { '<cmd>5ToggleTerm direction=float<CR>', 'Float Terminal' },
}

which_key.register(mappings, default_opts)
which_key.register(term_mappings, term_opts_n)
