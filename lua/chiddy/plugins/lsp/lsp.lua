---@class LazyPlugin
local M = {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
        'b0o/SchemaStore.nvim',
        'p00f/clangd_extensions.nvim',
        'simrat39/rust-tools.nvim',
        'ray-x/go.nvim',
        'withgod/vim-sourcepawn',
    },
}

function M.config()
    require('chiddy.core.lsp')
    require('chiddy.lsp')
end

return M
