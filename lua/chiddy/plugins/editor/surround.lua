---@class LazyPlugin
local M = {
    'kylechui/nvim-surround',
    event = 'InsertEnter',
}

function M.config()
    require('nvim-surround').setup({
        move_cursor = 'begin',
    })
end

return M
