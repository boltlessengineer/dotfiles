filetype plugin on

" leader key
let mapleader = ' '

" enabled options
set colorcolumn=80
set confirm
set cursorline
set expandtab
set ignorecase
set laststatus=2
set mouse=n
set nowrap
set number
set path=**
set relativenumber
set scrolloff=5
set shiftwidth=4
set showcmd
set sidescrolloff=12
set splitbelow
set splitright
set tabstop=4
set termguicolors
set timeoutlen=200
set undofile
set undolevels=10000
set winminwidth=10

" keymaps
nnoremap q <cmd>wincmd q<cr>
nnoremap Q q
xnoremap <silent> J :m '>+1<cr>gv=gv
xnoremap <silent> K :m '<-2<cr>gv=gv
nnoremap <c-j> <cmd>lnext<cr>
nnoremap <c-k> <cmd>lprev<cr>
nnoremap - <cmd>e %:h<cr>

" Auto undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u

nnoremap <leader>, :lclose<bar>call setloclist(0, map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr": v:val}'))<bar>lopen<cr>
nnoremap <leader>sg :lgrep -rn '' *<left><left><left>
nnoremap <leader>e :vimgrep "\%^" **/
" FIXME: really hacky way to do. I know
nnoremap <expr> <leader><leader> HarpoonPin()
func! HarpoonPin()
    return ":\u0015nnoremap <leader>" . count . " :buffer " . bufnr('%') . "<cr>\n"
endfunc

colorscheme evening

cnoreabbrev rere redir @*<bar>
cnoreabbrev sos source %
cabbrev w' w

" turn on autochdir while in Insert Mode to get relative path completion
" autochdir is quite dangerouse though
" autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
" autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

command! Inspect echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
