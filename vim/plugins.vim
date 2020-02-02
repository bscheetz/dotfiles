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
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter' " git status in the gutter
Plug 'tpope/vim-fugitive' " amazing git integration
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim' " super fast fuzzy finding
Plug 'ludovicchabant/vim-gutentags' " auto update tags
Plug 'nielsmadan/harlequin'		" sublime text coloring
Plug 'ap/vim-buftabline'
Plug 'mhinz/vim-grepper' " find text anywhere in project
Plug 'ryanoasis/vim-devicons' " nice icons
Plug 'Shougo/defx.nvim' " directory lister
Plug 'kristijanhusak/defx-icons' " icons for defx
Plug 'kristijanhusak/defx-git' " icons for defx-git
Plug 'rakr/vim-one' " vim-one theme
call plug#end()

colorscheme one
let g:gutentags_ctags_tagfile=".tags"

" let g:airline_theme='oceanicnext'
let g:airline_theme='one'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

"let g:Powerline_symbols='fancy'
set laststatus=2

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

" Defx
call defx#custom#column('icon', {
            \ 'directory_icon': '⯈',
            \ 'opened_icon': '⯆',
            \ })
" Git
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 1
let g:defx_git#show_ignored = 0
let g:defx_git#raw_mode = 0
" Icons
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

" ale linters
let b:ale_linters = {'python': ['pylint']}
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
