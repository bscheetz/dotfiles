local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = { "lua", "python", "bash", "javascript", "typescript", "cpp", "svelte", "html", "css" }, -- one of "all" or a list of languages
    auto_install = true,
    sync_install = false,                                                                                       -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" },                                                                                    -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml" } },
}
