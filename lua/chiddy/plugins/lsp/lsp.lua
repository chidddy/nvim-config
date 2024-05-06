---@class LazyPlugin
local M = {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'b0o/SchemaStore.nvim',
        'simrat39/rust-tools.nvim',
        'ray-x/go.nvim',
        'withgod/vim-sourcepawn',
        'williamboman/mason.nvim',
        'creativenull/efmls-configs-nvim',
    },
}

function M.config()
    -- require('mason').setup({
    --     ui = {
    --         border = 'rounded',
    --     },
    -- })
    --
    -- require('mason-lspconfig').setup({
    --     ensure_installed = require('chiddy.core.config').lsp.servers.installer,
    --     automatic_installation = false,
    -- })
    require('chiddy.core.lsp')
    require('chiddy.lsp')
end

return M
