---@class LazyPlugin
local M = {
    'goolord/alpha-nvim',
    event = 'VeryLazy',
}

function M.config()
    require('alpha').start(true, require('chiddy.ui.themes.' .. require('chiddy.core.config').theme .. '.alpha').config)
end

return M
