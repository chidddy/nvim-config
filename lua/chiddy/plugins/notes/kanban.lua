---@class LazyPlugin
local M = {
    'arakkkkk/kanban.nvim',
}

function M.config()
    require('kanban').setup({})
end

return M
