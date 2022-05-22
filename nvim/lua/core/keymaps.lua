local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

-- Normal --
-- Better window navigation

-- Resize with arrows

-- Navigate buffers
keymap("n", "<Right>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<Left>", ":BufferLineCyclePrev<CR>", opts)
-- keymap("n", "<leader>b", ":e ", { noremap = true })

-- Navigate tabs
keymap("n", "<Tab>", ":tabnext<CR>", opts)
keymap("n", "<S-Tab>", ":tabprev<CR>", opts)
keymap("n", "<leader>t", ":tabnew ", { noremap = true })

keymap("n", "<leader>l", ":lua ", { noremap = true })

keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)

-- Keeping search results centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Insert --
-- Press jk fast to exit Insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)
keymap("x", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text opt and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)