---@class LazyPlugin
local M = {
    'SmiteshP/nvim-navic',
}

function M.config()
    require('nvim-navic').setup({
        highlight = true,
    })
end

return M
