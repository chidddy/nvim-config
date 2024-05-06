---@class LazyPlugin
local M = {
    'gbprod/yanky.nvim',
    -- event = 'VeryLazy',
    dependencies = { { 'kkharji/sqlite.lua' } },
}

function M.config()
    require('yanky').setup({
        highlight = {
            timer = 150,
            on_put = true,
            on_yank = true,
        },
        ring = {
            storage = 'sqlite',
        },
        system_clipboard = {
            sync_with_ring = true,
        },
        preserve_cursor_position = {
            enabled = true,
        },
    })
    -- require('telescope').load_extension('yank_history')
end

return M
