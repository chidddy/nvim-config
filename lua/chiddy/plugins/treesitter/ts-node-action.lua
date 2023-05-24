---@class LazyPlugin
local M = {
    'CKolkey/ts-node-action',
}

function M.config()
    require('ts-node-action').setup({})
end

return M
