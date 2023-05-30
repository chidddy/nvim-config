---@class LazyPlugin
local M = {
    'stevearc/overseer.nvim',
    cmd = {
        'OverseerRun',
        'OverseerToggle',
    },
}

function M.config()
    require('overseer').setup({
        templates = { 'builtin' },
    })
end

return M
