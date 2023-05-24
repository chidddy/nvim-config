---@class LazyPlugin
local M = {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdLineEnter' },
}

function M.config()
    require('ultimate-autopair').setup({})
end

return M
