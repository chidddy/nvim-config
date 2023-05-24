---@class LazyPlugin
local plugin = {
    'nvimdev/template.nvim',
    cmd = 'Template',
}

function plugin.config()
    require('template').setup({
        -- config
        temp_dir = '~/.config/nvim/templates',
    })
end

return plugin
