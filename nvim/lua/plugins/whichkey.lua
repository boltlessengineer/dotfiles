local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end

which_key.setup({
  plugins = {
    presets = {
      operators = false,
    },
  },
  key_labels = {
    ["<leader>"] = "SPC",
  },
  layout = {
    align = "left"
  },
  ignore_missing = true,
})

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  a = { "<cmd>Alpha<CR>", "Alpha" },
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<CR>", "Find" },
    r = { "<cmd>Telescope oldfiles<CR>", "Recent" },
  },
  g = {
    name = "Git",
    s = { "<cmd>Telescope git_status<CR>", "Status" },
  },
  l = {
    name = "Lsp",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>",
      "Prev Diagnostic",
    },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
  },
  q = { "<cmd>bdelete<CR>", "Quit Buffer" },
  ["<leader>"] = {
    name = "Terminal",
    ["1"] = { "<cmd>1ToggleTerm<CR>", "1" },
    ["2"] = { "<cmd>2ToggleTerm<CR>", "2" },
    ["3"] = { "<cmd>3ToggleTerm<CR>", "3" },
    ["4"] = { "<cmd>4ToggleTerm<CR>", "4" },
    f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
  },
}

which_key.register(mappings, opts)