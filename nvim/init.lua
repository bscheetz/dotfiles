vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = os.getenv("PYENV_ROOT") .. "/versions/neovim3/bin/python3"
vim.env.PATH = table.concat({
	vim.env.PATH,
	vim.fn.stdpath("data") .. "/mason/bin",
	vim.fn.expand("~/.local/bin"),
	vim.fn.expand("~/.npm-global/bin"),
}, ":")

require("user.colors")
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.filetypes")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.nvim-tree")
require("user.lualine")
require("user.gitsigns")
require("user.bufferline")

vim.cmd("filetype plugin on")

vim.cmd("colorscheme darkplus")
