return {
    type = 'server',
    port = '${port}',
    executable = {
        command = require('chiddy.utils.dap').mason.package .. '/codelldb/extension/adapter/codelldb',
        args = { '--port', '${port}' },
    },
}
