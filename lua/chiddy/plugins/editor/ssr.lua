---@class LazyPlugin
local plugin = {
    'cshuaimin/ssr.nvim',
}

function plugin.config()
    require('ssr').setup({
        -- config
    })
end

return plugin
