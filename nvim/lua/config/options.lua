-- nvim/lua/config/options.lua
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true

-- nvim/lua/config/keymaps.lua
vim.g.mapleader = ' '
local map = vim.keymap.set
map('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
map('n', '<leader>q', ':q<CR>', { desc = 'Quit window' })
map('n', '<leader>e', ':Ex<CR>', { desc = 'Open file explorer' })

-- nvim/lua/config/lazy.lua
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', lazypath })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', { ui = { border = 'rounded' } })
