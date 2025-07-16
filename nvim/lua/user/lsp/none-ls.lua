local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
}

-- prefer eslint_d if available, else fall back to eslint
local eslint = null_ls.builtins.diagnostics.eslint_d
if not eslint then
    eslint = null_ls.builtins.diagnostics.eslint
end

if eslint then
    table.insert(sources, eslint)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
