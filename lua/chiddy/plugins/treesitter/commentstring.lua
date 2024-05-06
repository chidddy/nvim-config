---@class LazyPlugin
local M = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VeryLazy',
}

function M.config()
    require('ts_context_commentstring').setup({
        enable = true,
        enable_autocmd = true,
    })
end

return M
