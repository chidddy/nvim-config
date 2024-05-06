---@class LazyPlugin
local M = {
    'smjonas/inc-rename.nvim',
    event = 'VeryLazy',
    cmd = 'IncRename',
}

function M.config()
    require('inc_rename').setup({
        preview_empty_name = true,
    })
end

return M
