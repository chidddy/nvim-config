---@class LazyPlugin
local M = {
    'jackMort/ChatGPT.nvim',
}

function M.config()
    require('chatgpt').setup({})
end

return M
