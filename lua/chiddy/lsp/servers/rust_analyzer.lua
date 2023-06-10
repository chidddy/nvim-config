-- rust
local U = require('chiddy.utils.lsp')
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
        flags = U.default_flags,
        capabilities = U.capabilities(),
        on_attach = U.default_on_attach,
        settings = {
            ['rust-analyzer'] = {
                cargo = {
                    features = 'all',
                },
                procMacro = {
                    enable = true,
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
