---@class LazyPlugin
local plugin = {
    '{{_variable_}}',
}

function plugin.config()
    require('{{_variable_}}').setup({
        -- config
        {{_cursor_}}
    })
end

return plugin
