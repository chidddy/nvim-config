---@class LazyPlugin
local M = {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
}

function M.config()
    require('gitsigns').setup()
end

return M
