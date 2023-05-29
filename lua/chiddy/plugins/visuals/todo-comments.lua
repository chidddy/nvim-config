---@class LazyPlugin
local M = {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = 'BufReadPost',
}

function M.config()
    require('todo-comments').setup({
        signs = true, -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
            FIX = {
                icon = ' ', -- icon used for the sign, and in search results
                color = 'error', -- can be a hex color, or a named color (see below)
                alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = ' ', color = 'info', alt = { 'WIP' } },
            HACK = { icon = ' ', color = 'warning' },
            ERROR = { icon = ' ', color = 'error' },
            WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
            PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
            NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
            TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
        },
        colors = {
            error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
            warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
            info = { 'DiagnosticInfo', '#2563EB' },
            hint = { 'DiagnosticHint', '#10B981' },
            default = { 'Identifier', '#7C3AED' },
            test = { 'Identifier', '#FF00FF' },
        },
        search = {
            command = 'rg',
            args = {
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
            },
        },
    })
end

return M
