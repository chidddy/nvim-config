---@class LazyPlugin
local plugin = {
    'jbyuki/instant.nvim',
    cmd = {
        'InstantStartServer',
        'InstantStopServer',
        'InstantStartSingle',
        'InstantJoinSingle',
        'InstantStop',
        'InstantStartSession',
        'InstantJoinSession',
        'InstantStatus',
        'InstantFollow',
        'InstantStopFollow',
        'InstantOpenAll',
        'InstantSaveAll',
        'InstantMark',
        'InstantMarkClear',
    },
}

function plugin.config()
    vim.g.instant_username = require('chiddy.core.config').personal.username
end

return plugin
