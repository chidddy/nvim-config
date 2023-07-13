local U = {}

function U.capabilities()
    local capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities(),
        { textDocument = { foldingRange = { dynamicRegistration = false, lineFoldingOnly = true } } }
    )
    return capabilities
end

function U.disable_formatting(client, buf)
    client.server_capabilities.documentFormattingProvider = false
    U.default_on_attach(client, buf)
end

U.default_flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 150,
}

---@param client lsp.Client lsp client
---@param buf integer bufnr
function U.default_on_attach(client, buf)
    if client.name ~= 'null-ls' then
        require('chiddy.lsp.keymaps')(client, buf)
        if client.supports_method('textDocument/inlayHint', '') then
            vim.lsp.inlay_hint(buf, true)
        end
        if client.supports_method('textDocument/documentSymbol', '') then
            require('nvim-navic').attach(client, buf)
        end
    end
end

return U
