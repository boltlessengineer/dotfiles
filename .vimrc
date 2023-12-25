" leader key
let mapleader = ' '

" enabled options
set colorcolumn=80
set confirm
set cursorline
set expandtab
set ignorecase
set number
set relativenumber
set scrolloff=5
set shiftwidth=4
set sidescrolloff=12
set splitbelow
set splitright
set tabstop=4
set timeoutlen=200
set undofile
set undolevels=10000
set winminwidth=10

" disabled options
set nowrap

" keymaps
nnoremap q <cmd>wincmd q<cr>
nnoremap Q q
nnoremap gl g_
nnoremap gh g^
nnoremap gt H
nnoremap gb L
xnoremap <silent> J :m '>+1<cr>gv=gv
xnoremap <silent> K :m '<-2<cr>gv=gv

" Auto undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u

cabbrev w' w
