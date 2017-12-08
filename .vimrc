execute pathogen#infect()

set nocompatible

set nu
set ruler
set encoding=utf-8
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set cursorcolumn
set cursorline
set autoindent
set backspace=indent,eol,start
set incsearch

let mapleader=' '

filetype on
filetype plugin on

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme harlequin

let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:Powerline_symbols='fancy'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.pyc$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize=50

set rtp+=~/.fzf

" add mappings for a few plugins
nmap <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

" deoplete stuff
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :
            \ deplete#mappings#manual_complete()
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
