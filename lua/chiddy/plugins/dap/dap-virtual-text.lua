---@class LazyPlugin
local plugin = {
    'theHamsta/nvim-dap-virtual-text',
    event = 'BufReadPost',
}

function plugin.config()
    require('nvim-dap-virtual-text').setup({
        -- config
    })
end

return plugin
