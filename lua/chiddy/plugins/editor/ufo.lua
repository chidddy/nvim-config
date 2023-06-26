---@class LazyPlugin
local M = {
    'kevinhwang91/nvim-ufo',
    dependencies = { { 'kevinhwang91/promise-async' } },
    event = 'VeryLazy',
}

function M.config()
    require('ufo').setup()
end

return M
