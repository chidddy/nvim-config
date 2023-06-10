---@class LazyPlugin
local M = {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
}

function M.config()
    require('treesitter-context').setup({})
end

return M
