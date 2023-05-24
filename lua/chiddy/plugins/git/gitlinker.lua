---@class LazyPlugin
local M = {
    'ruifm/gitlinker.nvim',
}

function M.config()
    require('gitlinker').setup({})
end

return M
