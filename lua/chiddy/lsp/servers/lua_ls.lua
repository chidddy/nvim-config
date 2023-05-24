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
                groupSeverity = {
                    strong = 'Warning',
                    strict = 'Warning',
                },
                groupFileStatus = {
                    ['ambiguity'] = 'Opened',
                    ['await'] = 'Opened',
                    ['codestyle'] = 'None',
                    ['duplicate'] = 'Opened',
                    ['global'] = 'Opened',
                    ['luadoc'] = 'Opened',
                    ['redefined'] = 'Opened',
                    ['strict'] = 'Opened',
                    ['strong'] = 'Opened',
                    ['type-check'] = 'Opened',
                    ['unbalanced-check'] = 'Opened',
                    ['unused'] = 'Opened',
                },
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
