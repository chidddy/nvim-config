-- rust
local M = {}
-- M.config = {
--     flags = U.default_flags,
--     capabilities = U.capabilities(),
--     on_attach = U.default_on_attach,
--     settings = {
--         ['rust-analyzer'] = {
--             cargo = {
--                 allFeatures = true,
--             },
--             checkOnSave = {
--                 allFeatures = true,
--                 command = 'clippy',
--             },
--         },
--     },
-- }

local extension_path = vim.env.HOME .. '/.vscode-oss/extensions/vadimcn.vscode-lldb.1.9.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

M.config = {
    tools = {
        inlay_hints = {
            auto = false,
        },
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        standalone = false,
        settings = {
            ['rust-analyzer'] = {
                cargo = {
                    features = 'all',
                },
                checkOnSave = true,
                check = {
                    features = 'all',
                    command = 'clippy',
                },
            },
        },
    },
}

return M
