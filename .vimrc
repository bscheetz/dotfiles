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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-sleuth'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter' " git status in the gutter
Plug 'tpope/vim-fugitive' " amazing git integration
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim' " super fast fuzzy finding
Plug 'ludovicchabant/vim-gutentags' " auto update tags
Plug 'nielsmadan/harlequin'		" sublime text coloring
Plug 'ap/vim-buftabline'
Plug 'mhinz/vim-grepper' " find text anywhere in project
Plug 'Shougo/defx.nvim' " directory lister
Plug 'rakr/vim-one' " vim-one theme
call plug#end()


let g:gutentags_ctags_tagfile=".tags"

" let g:airline_theme='oceanicnext'
let g:airline_theme='one'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
"let g:Powerline_symbols='fancy'
set laststatus=2

" syntax enable
" colorscheme harlequin
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set background=dark " for the dark version
" set background=light " for the light version
colorscheme one

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

" FZF Bindings
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>

" search in entire project
nmap <Leader>fp :Rg<Space>

let b:ale_linters = {'python': ['pylint']}
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
