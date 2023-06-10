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

function U.default_on_attach(client, buf)
    if
        require('chiddy.core.config').lsp._loaded == false
        or (require('chiddy.core.config').lsp._loaded == true and client.name ~= 'null-ls')
    then
        require('chiddy.core.config').lsp._loaded = true
        require('lsp-inlayhints').on_attach(client, buf)
        require('chiddy.lsp.keymaps')(client, buf)
        if client.server_capabilities.documentSymbolProvider then
            require('nvim-navic').attach(client, buf)
        end
    end
end

return U
