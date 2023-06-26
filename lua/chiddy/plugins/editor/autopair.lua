---@class LazyPlugin
local plugin = {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter', 'CmdLineEnter' },
}

function plugin.config()
    require('nvim-autopairs').setup({
        -- config
    })
end

return plugin
