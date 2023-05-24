---@class LazyPlugin
local M = {
    'rcarriga/nvim-notify',
}

function M.config()
    vim.notify = require('notify')
    local icons = require('chiddy.utils.icons')
    vim.notify.setup({
        background_colour = 'CursorColumn',
        render = 'default',
        fps = 60,
        timeout = 1000,
        stages = 'fade',
        icons = {
            ERROR = icons.diagnostics.Error,
            WARN = icons.diagnostics.Warning,
            INFO = icons.diagnostics.Information,
            DEBUG = icons.ui.Bug,
            TRACE = icons.ui.Pencil,
        },
    })
end

return M
