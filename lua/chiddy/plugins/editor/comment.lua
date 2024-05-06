---@class LazyPlugin
local M = {
    'numToStr/Comment.nvim',
}

function M.config()
    require('Comment').setup({
        padding = true,
        sticky = true,
        mappings = {
            basic = false,
            extra = false,
            extended = false,
        },
        pre_hook = function(ctx)
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
    })
end

return M
