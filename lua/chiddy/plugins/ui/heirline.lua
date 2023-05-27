---@class LazyPlugin
local M = {
    'rebelot/heirline.nvim',
    event = 'VeryLazy',
}

function M.config()
    local heirline = require('heirline')
    local status = require('chiddy.ui.themes.' .. require('chiddy.core.config').theme .. '.heirline')
    heirline.load_colors(status.colors)
    heirline.setup({
        statusline = status.statuslines,
    })
end

return M
