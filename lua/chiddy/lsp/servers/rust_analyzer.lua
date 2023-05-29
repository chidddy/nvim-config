-- rust
local M = {}
local extension_path = require('chiddy.utils.dap').mason.package .. '/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
--
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
