---@class LazyPlugin
local M = {
    'kosayoda/nvim-lightbulb',
    event = 'VeryLazy',
}

function M.config()
    require('nvim-lightbulb').setup({
        autocmd = { enabled = true },
    })
end

return M
