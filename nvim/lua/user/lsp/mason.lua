local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

mason.setup()

local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
  return
end

local servers = { "sumneko_lua", "jsonls" }

mason_lspconfig.setup {
  ensure_installed = servers,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server_name)
    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end

    require("lspconfig")[server_name].setup(opts)
  end,
}
