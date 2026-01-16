local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

mason.setup()

local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
    return
end

local servers = { "lua_ls", "pyright", "svelte" }

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = false,
})

local handlers = require("user.lsp.handlers")

-- Configure LSP servers using vim.lsp.config
vim.lsp.config["*"] = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

for _, server in ipairs(servers) do
    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
    if has_custom_opts then
        vim.lsp.config[server] = server_custom_opts
    end
end

vim.lsp.enable(servers)
