---@class LazyPlugin
local M = {
    'kyazdani42/nvim-web-devicons',
}

function M.config()
    require('nvim-web-devicons').setup({
        default = true,
    })
end

return M
