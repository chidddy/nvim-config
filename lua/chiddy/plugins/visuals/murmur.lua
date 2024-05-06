---@class LazyPlugin
local M = {
    'nyngwang/murmur.lua',
    event = { 'BufReadPost', 'BufNewFile' },
}

function M.config()
    local cutils = require('chiddy.utils.colors')
    local colors = require('chiddy.ui.colors').get()
    -- vim.api.nvim_set_hl(0, 'murmur_cursor_rgb', {
    --     bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
    -- })
    -- vim.api.nvim_set_hl(0, 'murmur_cursor_rgb_current', {
    --     bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
    -- })
    require('murmur').setup({
        cursor_rgb = {
            bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
        },
        cursor_rgb_current = {
            bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
        },
        yank_blink = {
            enabled = false,
            on_yank = nil,
        },
        -- cursor_rgb_always_use_config = true, -- if set to `true`, then always use `cursor_rgb`.
        max_len = 80,
        min_len = 2,
        exclude_filetypes = require('chiddy.core.config').ft.disable_visuals,
        callbacks = {
            -- to trigger the close_events of vim.diagnostic.open_float.
            function()
                local mode = vim.api.nvim_get_mode()
                if mode.mode == 'i' then
                    vim.cmd('doautocmd InsertEnter')
                else
                    vim.cmd('doautocmd InsertEnter')
                    require('modes').reset()
                end
                -- Close floating diag. and make it triggerable again.
                -- vim.cmd('doautocmd InsertEnter')
                vim.w.diag_shown = false
                -- require('modes').reset()
            end,
        },
    })
end

return M
