local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "akinsho/bufferline.nvim"
    use "windwp/nvim-autopairs"
    use "lewis6991/impatient.nvim"

    use "nvim-lualine/lualine.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use { "williamboman/mason.nvim", run = ":MasonUpdate" }
    use "williamboman/mason-lspconfig.nvim"
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "nvimtools/none-ls.nvim" -- for formatters and linters
    use {
        "folke/noice.nvim", -- better LSP UI
        config = function() require("user.noice")
            end,
        requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    }

    -- NvimTree
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    -- colorscheme
    use "LunarVim/darkplus.nvim"

    use {
        "nvim-treesitter/nvim-treesitter",
    }
    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    }
    use "HiPhish/rainbow-delimiters.nvim"

    use "lewis6991/gitsigns.nvim"
    use "christoomey/vim-tmux-navigator"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
