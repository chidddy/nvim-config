---@class LazyPlugin
local plugin = {
    'VidocqH/lsp-lens.nvim',
    enabled = false,
    event = 'LspAttach',
}

function plugin.config()
    require('lsp-lens').setup({
        -- config
    })
end

return plugin
