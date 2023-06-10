---@class LazyPlugin
local plugin = {
    'echasnovski/mini.colors',
}

function plugin.config()
    require('mini.colors').setup({})
end

return plugin
