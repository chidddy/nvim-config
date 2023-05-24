---@class LazyPlugin
local M = {
    'andythigpen/nvim-coverage',
}

function M.config()
    require('coverage').setup()
end

return M
