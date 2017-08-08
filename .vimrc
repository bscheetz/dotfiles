execute pathogen#infect()

set nocompatible

set nu
set ruler
set encoding=utf-8
set wrap
set tabstop=4
set expandtab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

let g:airline_theme='deus'

nmap <F8> :TagbarToggle<CR>

let g:indent_guides_enable_on_vim_startup = 1
