---@class LazyPlugin
local M = {
    'goolord/alpha-nvim',
    -- event = 'VeryLazy',
}

function M.config()
    -- require('alpha').start(true, require('chiddy.ui.themes.' .. require('chiddy.core.config').theme .. '.alpha').config)
    -- local theme = string.format('chiddy.ui.themes.%s.alpha', require('chiddy.core.config').theme)
    -- require('alpha').start(true, require(theme).config)
    -- require('alpha').setup(require(theme).config)
end

return M
