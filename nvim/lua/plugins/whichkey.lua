local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then return end

which_key.setup({
  plugins = {
    presets = {
      operators = false,
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

local opts = {
  mode = 'n', -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  a = { '<cmd>Alpha<CR>', 'Alpha' },
  b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
  f = {
    name = 'File',
    f = { '<cmd>Telescope find_files<CR>', 'Find' },
    r = { '<cmd>Telescope oldfiles<CR>', 'Recent' },
    g = { '<cmd>Telescope live_grep<CR>', 'Live Grep' }
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
    D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration' },
    d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Definition' },
    f = { "<cmd>lua require('core.lsp.handlers').toggle_format_on_save()<CR>", 'Toggle AutoFormat' },
    I = { '<cmd>LspInstallInfo<CR>', 'Installer Info' },
    i = { '<cmd>LspInfo<CR>', 'Info' },
    j = {
      '<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>',
      'Next Diagnostic',
    },
    k = {
      '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>',
      'Prev Diagnostic',
    },
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
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

which_key.register(mappings, opts)
