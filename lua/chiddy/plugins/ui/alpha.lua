---@class LazyPlugin
local plugin = {
    'goolord/alpha-nvim',
    event = 'VeryLazy',
}

function plugin.config()
    local theme = string.format('chiddy.ui.themes.%s.alpha', require('chiddy.core.config').theme)
    require('alpha').start(true, {
        layout = require(theme),
        opts = {
            margin = 5,
            noautocmd = true,
            autostart = false,
            keymap = {
                press = '<CR>',
                queue_press = '<M-CR>',
            },
        },
    })
end

return plugin
