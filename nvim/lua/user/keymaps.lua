local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
-- map arrow keys in normal mode to shift pane edges
vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize -1<CR>", opts)
vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize +1<CR>", opts)
vim.api.nvim_set_keymap("n", "<Up>", ":resize -1<CR>", opts)
vim.api.nvim_set_keymap("n", "<Down>", ":resize +1<CR>", opts)

-- return to the last file opened by pressing leader leader
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<c-^>", opts)

-- press tab to switch to the next buffer
-- press shift tab to switch to the previous buffer
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext!<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev!<CR>", opts)
