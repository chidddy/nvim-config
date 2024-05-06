---@class LazyPlugin
local plugin = {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    enabled = false,
}

function plugin.config()
    require('lint').linters_by_ft = {
        markdown = { 'vale' },
        lua = { 'selene' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
    }
end

return plugin
