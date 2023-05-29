---@class LazyPlugin
local plugin = {
    'rcarriga/nvim-dap-ui',
}

function plugin.config()
    require('dapui').setup({
        -- config
    })
end

return plugin
