---@class LazyPlugin
local plugin = {
    'dgagn/diagflow.nvim',
    event = 'LspAttach',
}

function plugin.config()
    require('diagflow').setup({
        enable = true,
        max_width = 100,
        max_height = 16,
        severity_colors = {
            error = 'DiagnosticFloatingError',
            warn = 'DiagnosticFloatingWarn',
            info = 'DiagnosticFloatingInfo',
            hint = 'DiagnosticFloatingHint',
        },
        format = function(diagnostic)
            return diagnostic.message
        end,
        show_sign = false,
        gap_size = 1,
        scope = 'line', -- 'cursor', 'line'
        placement = 'top', -- top or inline
        padding_top = 0,
        padding_right = 0,
        inline_padding_left = 0, -- padding only for when the placement is inline
        text_align = 'right', -- 'left', 'right'
        update_event = { 'DiagnosticChanged', 'BufReadPost' },
        toggle_event = {},
        render_event = { 'CursorMoved', 'DiagnosticChanged' },
        border_chars = {
            top_left = '┌',
            top_right = '┐',
            bottom_left = '└',
            bottom_right = '┘',
            horizontal = '─',
            vertical = '│',
        },
        show_borders = false,
    })
end

return plugin
