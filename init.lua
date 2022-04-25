vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "$PYENV_ROOT/versions/neovim3/bin/python3"

local options = {
    compatible = false,
    nu = true,
    ruler = true,
    encoding = "utf-8",
    wrap = false,
    -- set tab width to 4 spaces
    tabstop = 4,
    shiftwidth = 4,
    -- replace tab with spaces
    expandtab = true,
    cursorcolumn = true,
    cursorline = true,
    autoindent = true,
    backspace = "indent,eol,start",
    -- turn on incremental search
    incsearch = true,
    errorbells = false,
    number = true,
    -- highlight search matches
    hlsearch = true,
    -- set relative line numbers instead of absolute
    relativenumber = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
-- map arrow keys in normal mode to shift pane edges
vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize -1<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize +1<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Up>", ":resize -1<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Down>", ":resize +1<CR>", {noremap = true})

-- return to the last file opened by pressing leader leader
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<c-^>", {})

-- press tab to switch to the next buffer
-- press shift tab to switch to the previous buffer
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext!<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev!<CR>", {noremap = true})

vim.g.mapleader = " "
vim.cmd 'filetype plugin on'
vim.cmd 'set rtp+=~/.fzf'

local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.local/share/nvim/plugged")
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes' --themes for airline
Plug 'unblevable/quick-scope' -- highlight useful character jumps
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar' -- show tags in sidebar
Plug('Shougo/deoplete.nvim', {['do'] = ':UpdateRemotePlugins'})
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-sleuth'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter' -- git status in the gutter
Plug 'tpope/vim-fugitive' -- amazing git integration
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim' -- super fast fuzzy finding
Plug 'ludovicchabant/vim-gutentags' -- auto update tags
Plug 'nielsmadan/harlequin'	-- sublime text coloring
Plug 'ap/vim-buftabline'
Plug 'mhinz/vim-grepper' -- find text anywhere in project
Plug 'ryanoasis/vim-devicons' -- nice icons
Plug 'Shougo/defx.nvim' -- directory lister
Plug 'kristijanhusak/defx-icons' -- icons for defx
Plug 'kristijanhusak/defx-git' -- icons for defx-git
Plug 'rakr/vim-one' -- vim-one theme
Plug 'christoomey/vim-tmux-navigator' -- removes need for tmux prefix in navigating between tmux and vim panes
vim.call("plug#end")

vim.g.gutentags_ctags_tagfile = ".tags"

vim.g.airline_them = "one"
vim.g.airline_powerline_fonts = 1
-- TODO FIX
vim.cmd('let g:airline#extension#tabline#enabled = 1')

vim.opt.laststatus=2

vim.opt.termguicolors = true

vim.opt.background = "dark"
vim.cmd "colorscheme one"

vim.g.SuperTabDefaultCompletionType = "<c-n>"

-- TODO: FIX DEOPLETE STUFF
vim.cmd('let g:deoplete#enable_at_startup = 1')
vim.api.nvim_set_keymap(
    "i", 
    "<silent><expr><Tab>",
    "pumvisible() ? '\\<C-n>' : deoplete#mappings#manual_complete()",
    {noremap = true}
)

vim.api.nvim_set_keymap("n", "<F8>", ":TagbarToggle<CR>", {})
vim.cmd "set statusline+=%#warningmsg#"
vim.cmd "set statusline+=%{fugitive#statusline()}"
vim.cmd "set statusline+=%*"

vim.api.nvim_set_keymap("n", ";", ":Buffers<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>f", ":Files<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>t", ":Tags<CR>", {})

vim.api.nvim_set_keymap("n", "<Leader>fp", ":Rg<Space>", {})

-- ale linters
vim.b.ale_linters = {python = {"pylint"}}
vim.b.ale_fixers = {"remove_trailing_lines", "trime_whitespace"}