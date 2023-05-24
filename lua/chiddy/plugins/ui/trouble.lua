---@class LazyPlugin
local M = {
    'folke/trouble.nvim',
}

function M.config()
    local icons = require('chiddy.utils.icons')
    require('trouble').setup({
        position = 'bottom',
        icons = true,
        mode = 'workspace_diagnostics',
        use_lsp_diagnostic_signs = false,
        indent_lines = true,
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        fold_open = icons.ui.ArrowOpen,
        fold_closed = icons.ui.ArrowClosed,
        signs = {
            error = icons.diagnostics.Error_alt,
            warning = icons.diagnostics.Warning_alt,
            hint = icons.diagnostics.Hint_alt,
            information = icons.diagnostics.Information_alt,
            other = icons.diagnostics.Question_alt,
        },
    })
end

return M
