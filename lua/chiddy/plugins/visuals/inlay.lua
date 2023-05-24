---@class LazyPlugin
local M = {
    'lvimuser/lsp-inlayhints.nvim',
}

function M.config()
    require('lsp-inlayhints').setup({
        inlay_hints = {
            parameter_hints = {
                show = true,
                prefix = '<- ',
                separator = ', ',
                remove_colon_start = false,
                remove_colon_end = true,
            },
            type_hints = {
                show = true,
                prefix = '<~ ',
                separator = ', ',
                remove_colon_start = false,
                remove_colon_end = false,
            },
            label_separator = '   ',
            max_len_align = false,
            max_len_align_padding = 1,
            only_current_line = false,
            highlight = 'Identifier',
        },
        enabled_at_startup = true,
        debug_mode = false,
    })
end

return M
