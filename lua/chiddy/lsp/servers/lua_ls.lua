-- lua
local M = {}

M.config = {
    single_file_support = true,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = { '?.lua', '?/init.lua' },
                meta = 'LuaJIT en-us utf8',
                pathStrict = true,
            },
            completion = {
                callSnippet = 'Both',
                workspaceWord = true,
            },
            diagnostics = {
                enable = false,
                unusedLocalExclude = { '_*' },
            },
            format = {
                enable = false,
            },
            semantic = {
                enable = true,
            },
            workspace = {
                maxPreload = 100000,
                preload_FileSize = 500,
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
            hint = {
                enable = true,
            },
        },
    },
}

return M
