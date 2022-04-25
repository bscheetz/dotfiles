local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
-- map arrow keys in normal mode to shift pane edges
keymap("n", "<Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<Right>", ":vertical resize +1<CR>", opts)
keymap("n", "<Up>", ":resize -1<CR>", opts)
keymap("n", "<Down>", ":resize +1<CR>", opts)

-- return to the last file opened by pressing leader leader
keymap("n", "<Leader><Leader>", "<c-^>", opts)

-- press tab to switch to the next buffer
-- press shift tab to switch to the previous buffer
keymap("n", "<Tab>", ":bnext!<CR>", opts)
keymap("n", "<S-Tab>", ":bprev!<CR>", opts)

-- better movement between vim panes
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
