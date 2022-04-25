vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "$PYENV_ROOT/versions/neovim3/bin/python3"

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"

vim.cmd 'filetype plugin on'
vim.cmd 'set rtp+=~/.fzf'

vim.cmd "colorscheme darkplus"

--vim.api.nvim_set_keymap("n", ";", ":Buffers<CR>", {})
--vim.api.nvim_set_keymap("n", "<Leader>f", ":Files<CR>", {})
--vim.api.nvim_set_keymap("n", "<Leader>t", ":Tags<CR>", {})

--vim.api.nvim_set_keymap("n", "<Leader>fp", ":Rg<Space>", {})

-- ale linters
-- vim.b.ale_linters = {python = {"pylint"}}
-- vim.b.ale_fixers = {"remove_trailing_lines", "trime_whitespace"}
