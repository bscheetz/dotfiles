vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "$PYENV_ROOT/versions/neovim3/bin/python3"

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.nvim-tree"

vim.cmd 'filetype plugin on'
--vim.cmd 'set rtp+=~/.fzf'

vim.cmd "colorscheme darkplus"
