local icons = require('chiddy.utils.icons')
---@class LazyPlugin
local M = {
    'kosayoda/nvim-lightbulb',
    event = 'VeryLazy',
}

function M.config()
    require('nvim-lightbulb').setup({
        autocmd = { enabled = true },
        sign = {
            enabled = true,
            text = icons.ui.Bell,
        },
    })
end

return M
