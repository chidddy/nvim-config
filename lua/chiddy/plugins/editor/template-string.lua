---@class LazyPlugin
local M = {
    'axelvc/template-string.nvim',
    ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'python' },
}

function M.config()
    require('template-string').setup({
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
        jsx_brackets = true,
        remove_template_String = false,
        restore_quotes = {
            normal = [[']],
            jsx = [["]],
        },
    })
end
return M
