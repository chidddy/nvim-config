---@class LazyPlugin
local plugin = {
    'sindrets/diffview.nvim',
}

function plugin.config()
    require('diffview').setup({
        -- config
    })
end

return plugin
