filetype indent plugin on

syntax on

call plug#begin('~/.vim/plugged')
" General
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer'
Plug 'morhetz/gruvbox'
" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Javascript
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
" Misc
Plug 'tpope/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'luochen1990/rainbow'
Plug 'inside/vim-search-pulse'
" Auto complete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'davidhalter/jedi-vim'
" Completion engines
 Plug 'ncm2/ncm2-cssomni'
 Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
 Plug 'ncm2/ncm2-jedi'
 Plug 'ncm2/ncm2-html-subscope'
call plug#end()

nnoremap <Space> <Nop>
let mapleader = " "

nnoremap ; :
nnoremap q; q:

" Map escape in terminal to go to normal
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>b :buffers<cr>:b<space>
nnoremap <leader>/ :noh<cr>
nnoremap <leader>q :b#<cr>
nnoremap <leader><S-n> :NERDTreeFind<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>r :%s//g<left><left>
nnoremap <leader>d :g//d<left><left>

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gd :Gdelete<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gm :Gmerge<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gu :Gpull<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Git<space>add<space>-v<space>.<cr>
nnoremap <leader>go :Git<space>checkout<space>
nnoremap <leader>gb :Git<space>checkout<space>-b<space>
nnoremap <leader>gx :Git<space>

nnoremap <leader>mm :silent<space>make\|redraw!\|cc<cr>
nnoremap <leader>mo :copen<cr>
nnoremap <leader>mf :set<space>makeprg=flake8<cr>
" nnoremap <leader>me :set<space>makeprg=eslint<space>--format<space>compact<cr>
nnoremap <leader>mt :vsp term://pytest -x<cr>
nnoremap <leader>mr :vsp term://flask run<cr>

nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><
nnoremap <c-j> :<c-u>exe ":m.+".v:count1<cr>
nnoremap <c-k> :<c-u>exe ":m.-".(v:count1+1)<cr>
nnoremap <c-l> J$

map ^ <nop>
map { <nop>
map } <nop>

nnoremap H ^
nnoremap J }
nnoremap K {
nnoremap L $
nnoremap Y y$

set guifont=Hack:h11
set noeb
set rnu
set nu
set noswapfile
set enc=utf-8
set wildignore+=venv,*__pycache__*,*.swp,*.exe,*.pyc,*/tmp*,node_modules,*.db
set clipboard+=unnamed
set nocompatible
set nowrap
set showmatch
set showcmd
set cursorline
set hlsearch
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set go-=m
set go-=T
set fileformat=unix
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitright

au BufNewFile,BufRead *.js,*.jsx,*.html,*.css,*.vue
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.rst
    \ set tabstop=3 |
    \ set softtabstop=3 |
    \ set shiftwidth=3

let python_highlight_all = 1
let NERDTreeRespectWildIgnore=1
let g:rainbow_active = 1

autocmd FileType python setlocal completeopt-=preview
autocmd FileType vue syntax sync fromstart

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#goto_command = "<leader>sc"
let g:jedi#goto_assignments_command = "<leader>sa"
let g:jedi#documentation_command = "<leader>sd"
let g:jedi#usages_command = "<leader>su"

nmap <silent> <leader>sr :Semshi rename<CR>

let g:python_host_prog = systemlist('which python')[0]
let g:python3_host_prog = systemlist('which python3')[0]

" Colors
set termguicolors
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_number_column = 'bg1'
let g:gruvbox_color_column = 'purple'
let g:gruvbox_vert_split = 'blue'
colorscheme gruvbox
set background=dark

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return '  '.fugitive#head().' '
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%1*%{GitInfo()}
set statusline+=%2*\ %f%m%r%h%w
set statusline+=%=
set statusline+=\ %l/%L\ :\ %c

hi User1 ctermfg=007 ctermbg=239 guibg=#32302f guifg=#8ec07c
hi User2 ctermfg=236 ctermbg=236 guibg=#504945 guifg=#d5c4a1

" display tabs and trailing whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uD7,nbsp:~"
set list

if &shell =~# 'fish$'
    set shell=sh
endif

