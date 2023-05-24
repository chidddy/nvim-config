---@class LazyPlugin
local M = {
    'rebelot/heirline.nvim',
    event = 'VeryLazy',
}

function M.config()
    local heirline = require('heirline')
    local status = require('chiddy.themes.' .. require('chiddy.core.config').theme .. '.status')

    -- local winbar = {}
    -- local tabline = {}

    heirline.load_colors(status.colors)
    heirline.setup({
        statusline = status.statuslines,
    })
end

return M
