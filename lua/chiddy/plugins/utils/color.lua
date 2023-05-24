---@class LazyPlugin
local M = {
    'uga-rosa/ccc.nvim',
    event = 'BufReadPost',
}

function M.config()
    local icons = require('chiddy.utils.icons')
    require('ccc').setup({
        default_color = '#000000',
        bar_char = icons.sep.Block,
        point_char = icons.ui.Indicator,
        highlighter = {
            auto_enable = true,
        },
    })
end

return M
