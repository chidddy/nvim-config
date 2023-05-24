---@class LazyPlugin
local M = {
    '{{ url }}',
}

function M.config()
    require('{{ module }}').setup({
        {{cursor}}
    })
end

return M
