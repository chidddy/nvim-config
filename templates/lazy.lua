---@class LazyPlugin
local M = {
    '{{_variable_}}',
}

function M.config()
    require('{{_variable_}}').setup({
        -- config
        {{_cursor_}}
    })
end

return M
