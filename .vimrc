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

filetype on
filetype plugin on

syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

let g:airline_theme='deus'

nmap <F8> :TagbarToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

