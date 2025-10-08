local handlers = require("user.lsp.handlers")

return {
  on_attach = function(client, bufnr)
    handlers.on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
