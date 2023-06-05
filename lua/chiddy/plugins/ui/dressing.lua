---@class LazyPlugin
local plugin = {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
}

function plugin.config()
    require('dressing').setup({
        -- config
        input = {
            enable = true,
            insert_only = true,
        },
        select = {
            enable = true,
        },
    })
end

return plugin
