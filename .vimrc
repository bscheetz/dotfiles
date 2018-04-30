function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

let g:loaded_python_provider = 0
let g:python3_host_prog = $PYTHON3PATH

set nocompatible

set nu
set ruler
set encoding=utf-8
set nowrap
" set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
" replace tab with spaces
set expandtab
set cursorcolumn
set cursorline
set autoindent
set backspace=indent,eol,start
" turn on incremental search
set incsearch
set noerrorbells
set number
" highlight search matches
set hlsearch
" set relative line numbers instead of absolute
set relativenumber

nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" return to the last file opened by pressing leader leader
nmap <Leader><Leader> <c-^>

" press `tab` to switch to the next buffer
" press `shift tab` to switch to the previous buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

let mapleader=' '

filetype plugin on

set rtp+=~/.fzf

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'	" themes for airline
Plug 'unblevable/quick-scope'		" highlight useful character jumps
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'	" show tags in sidebar
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-sleuth'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nielsmadan/harlequin'		" sublime text coloring
Plug 'ap/vim-buftabline'
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlP'} " Great fuzzy finder
Plug 'mhinz/vim-grepper' " find text anywhere in project
Plug 'Shougo/vimfiler.vim' " directory lister
Plug 'justinmk/vim-sneak' " efficient code targeting
call plug#end()


let g:gutentags_ctags_tagfile=".tags"

let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
"let g:Powerline_symbols='fancy'
set laststatus=2

"syntax enable
colorscheme harlequin

" Reverse SuperTab completion direction
let g:SuperTabDefaultCompletionType = "<c-n>"

" deoplete stuff
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :
            \ deoplete#mappings#manual_complete()
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" add mappings for a few plugins
nmap <F8> :TagbarToggle<CR>
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*

" Open CtrlP
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" search in entire project
nnoremap <Leader>fp :Grepper<Space>-query<Space> 
" search in open buffers
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" Sneak shortcuts
let g:sneak#s_next=1
omap F <Plug>Sneak_F
