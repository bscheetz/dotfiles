local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

mason.setup()

local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
	return
end

local servers = { "lua_ls", "jsonls", "pyright", "vtsls", "svelte" }

mason_lspconfig.setup({
	ensure_installed = servers,
})

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = false,
	automatic_enable = true,
})

local lspconfig = require("lspconfig")
local handler_opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
}

for _, server in ipairs(servers) do
	local opts = vim.tbl_deep_extend("force", {}, handler_opts)

        local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	lspconfig[server].setup(opts)
end
