---@class LazyPlugin
local plugin = {
    'folke/which-key.nvim',
}

function plugin.config()
    require('which-key').setup({})
end

return plugin
