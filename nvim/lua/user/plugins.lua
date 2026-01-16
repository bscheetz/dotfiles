local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    "nvim-lua/plenary.nvim",
    "akinsho/bufferline.nvim",
    "windwp/nvim-autopairs",
    "nvim-lualine/lualine.nvim",

    -- cmp plugins
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",

    -- LSP
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        build = function()
            pcall(vim.cmd, "MasonUpdate")
        end,
    },
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
    "nvimtools/none-ls-extras.nvim",
    -- NvimTree
    "kyazdani42/nvim-web-devicons",
    "kyazdani42/nvim-tree.lua",
    -- colorscheme
    "LunarVim/darkplus.nvim",
    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    --"evanleck/vim-svelte",
    -- Telescope
    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "HiPhish/rainbow-delimiters.nvim",
    "lewis6991/gitsigns.nvim",
    "christoomey/vim-tmux-navigator",
}, {
    ui = {
        border = "rounded",
    },
})
