---@class LazyPlugin
local M = {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonUpdate' },
    build = ':MasonUpdate',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
}

function M.config()
    require('mason').setup({
        ui = {
            border = 'rounded',
        },
    })

    require('mason-lspconfig').setup({
        ensure_installed = require('chiddy.core.config').lsp.servers.installer,
        automatic_installation = false,
    })
end

return M
