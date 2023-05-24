---@class LazyPlugin
local M = {
    'goolord/alpha-nvim',
    event = 'VeryLazy',
}

function M.config()
    require('alpha').start(true, require('chiddy.themes.' .. require('chiddy.core.config').theme .. '.alpha').config)
    -- require('alpha').setup(require('themes.' .. require('core.config').theme .. '.alpha').config)
    -- require('alpha').start(true)
end

return M
