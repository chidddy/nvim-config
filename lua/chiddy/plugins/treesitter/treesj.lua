---@class LazyPlugin
local M = {
    'wansmer/treesj',
}

function M.config()
    require('treesj').setup({
        use_default_keymaps = false,
        notify = true,
        check_syntax_error = true,
        max_join_length = 120,
        cursor_behavior = 'hold', -- hold/start/end
    })
end

return M
