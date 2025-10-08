-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Node"))
end

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    renderer = {
        root_folder_label = false,
    },
    view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    on_attach = on_attach,
})
