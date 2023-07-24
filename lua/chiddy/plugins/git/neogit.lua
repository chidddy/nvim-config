---@class LazyPlugin
local M = {
    'NeogitOrg/neogit',
}

function M.config()
    local icons = require('chiddy.utils.icons')
    require('neogit').setup({
        auto_refresh = true,
        auto_show_console = false,
        disable_builtin_notifications = true,
        disable_commit_confirmation = true,
        disable_insert_on_commit = true,
        use_magit_keybindings = false,
        signs = {
            hunk = { '', '' },
            item = { icons.ui.ArrowClosed, icons.ui.ArrowOpen },
            section = { icons.ui.ArrowClosed, icons.ui.ArrowOpen },
        },
        integrations = {
            diffview = true,
        },
    })
end

return M
