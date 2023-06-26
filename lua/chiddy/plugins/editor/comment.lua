---@class LazyPlugin
local M = {
    'numToStr/Comment.nvim',
}

function M.config()
    require('Comment').setup({
        padding = true,
        sticky = true,
        -- toggler = {
        --     line = 'gcc',
        --     block = 'gbc',
        -- },
        -- opleader = {
        --     line = 'gc',
        --     block = 'gb',
        -- },
        -- extra = {
        --     above = 'gcO',
        --     below = 'gco',
        --     eol = 'gcA',
        -- },
        mappings = {
            basic = false,
            extra = false,
            extended = false,
        },
        -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        pre_hook = function(ctx)
            -- inlay-hints
            -- local line_start = (ctx.srow or ctx.range.srow) - 1
            -- local line_end = ctx.erow or ctx.range.erow
            -- require('lsp-inlayhints.core').clear(0, line_start, line_end)

            local U = require('Comment.utils')
            -- determine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

            -- determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.blockwise then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = type,
                location = location,
            })
        end,
        -- post_hook = function(ctx)
        --     local r = unpack(vim.api.nvim_win_get_cursor(0))
        --     local rcnt = vim.api.nvim_buf_line_count(0)
        --     if rcnt > r then
        --         vim.api.nvim_win_set_cursor(0, {r+1,0})
        --     end
        -- end,
    })
end

return M
