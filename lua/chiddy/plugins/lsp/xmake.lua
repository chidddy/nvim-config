---@class LazyPlugin
local M = {
    'Adversarr/xmake-nvim',
}

function M.config()
    require('xmake-nvim').setup({
        -- config
    })
end

return M
