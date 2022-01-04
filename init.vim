" Change shell to bash
" check : Nvim-tree issue (#549)
set shell=/bin/bash

" ===========================
" Plugins:
" ===========================

call plug#begin('~/.config/nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'nvim-lua/plenary.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
"Plug 'tami5/lspsaga.nvim'
" Completion:
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'onsails/lspkind-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Languages:
" - flutter
Plug 'akinsho/flutter-tools.nvim'
Plug 'Neevash/awesome-flutter-snippets'

" Themes:
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()


" ===========================
" Theme:
" ===========================

let g:tokyonight_style = "night"
" transparent backgrounds & sidebar/floats
"let g:tokyonight_dark_sidebar = 0
"let g:tokyonight_dark_float = 0
"let g:tokyonight_transparent = 1
let g:tokyonight_alt_nc = 1
colorscheme tokyonight

" ===========================
" Settings:
" ===========================

set nobackup                " [CoC] Some servers have issues with backup files
set nowritebackup
"set cmdheight=2             " [CoC] Give more space for displaying messages
set shortmess+=c            " [CoC] Don't pass messages to ins-completion-menu

set updatetime=750          " Having shorder update time

set tabstop=2               " Use beautiful 2-space tab
set shiftwidth=2
set softtabstop=2
set expandtab               " Change tab to spaces
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·


set noshowmode              " Hide '--Insert--' thing
set colorcolumn=80          " Show an 80 column border for good coding
set nowrap

set number
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave,BufWinLeave * setlocal nocursorline
augroup END

set scrolloff=10            " Set cursorline close to center

set termguicolors           " Enable gui colors

set showtabline=2           " Always show tabline

" ===========================
" Maps:
" ===========================

" Tabs
nnoremap <Space>t :tabedit 
nnoremap <Tab> <cmd>BufferLineCycleNext<CR>
nnoremap <S-Tab> <cmd>BufferLineCyclePrev<CR>

" Switching between windows
nnoremap <Space> <C-w>

" Keeping search results centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Nvimtree
nnoremap <Space>e <cmd>NvimTreeToggle<CR>

" Comment lines
" : https://stackoverflow.com/a/48690620/13150270
if has('win32')
  vmap <C-/> :norm i
else
  vmap <C-_> :norm i
endif

" vsnip
"inoremap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
"inoremap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" format
"nnoremap <C-r> <cmd>lua vim.lsp.buf.formatting()<CR>
