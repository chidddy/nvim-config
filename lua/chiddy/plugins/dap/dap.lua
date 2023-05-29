---@class LazyPlugin
local M = {
    'mfussenegger/nvim-dap',
    event = 'BufReadPost',
    dependencies = {
        'nvim-telescope/telescope-dap.nvim',
    },
}

function M.config()
    require('telescope').load_extension('dap')
    require('chiddy.dap')
end

return M
