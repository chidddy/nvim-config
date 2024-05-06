---@class LazyPlugin
local plugin = {
    'm4xshen/hardtime.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
}

function plugin.config()
    require('hardtime').setup({
        disabled_filetypes = require('chiddy.core.config').ft.disable_visuals,
        enabled = false,
        notification = true,
        hint = true,
    })
end

return plugin
