---@class LazyPlugin
local M = {
    'rebelot/heirline.nvim',
    event = 'VeryLazy',
}

function M.config()
    -- local heirline = require('heirline')
    -- local status = require('chiddy.ui.themes.' .. require('chiddy.core.config').theme .. '.heirline')
    local status = require('chiddy.ui.themes.' .. require('chiddy.core.config').theme .. '.heirline.statusline')
    require('heirline').setup({
        statusline = status.statuslines,
        opts = {
            colors = status.colors,
        },
    })
end

return M
