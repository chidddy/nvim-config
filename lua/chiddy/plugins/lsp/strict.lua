---@class LazyPlugin
local M = {
    'emileferreira/nvim-strict',
}

function M.config()
    require('strict').setup({
        -- config
    })
end

return M
