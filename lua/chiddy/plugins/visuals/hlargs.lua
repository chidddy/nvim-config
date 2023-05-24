---@class LazyPlugin
local M = {
    'm-demare/hlargs.nvim',
    event = 'BufReadPost',
}

function M.config()
    require('hlargs').setup({
        color = '#ef9062',
        use_colorpalette = false,
        colorpalette = {
            { fg = '#ef9062' },
            { fg = '#3AC6BE' },
            { fg = '#35D27F' },
            { fg = '#EB75D6' },
            { fg = '#E5D180' },
            { fg = '#8997F5' },
            { fg = '#D49DA5' },
            { fg = '#7FEC35' },
            { fg = '#F6B223' },
            { fg = '#F67C1B' },
            { fg = '#DE9A4E' },
            { fg = '#BBEA87' },
            { fg = '#EEF06D' },
            { fg = '#8FB272' },
        },
        highlight = {},
        excluded_filetypes = require('chiddy.core.config').ft_strict_disabled,
        disable = function(lang, bufnr)
            return vim.tbl_contains(require('chiddy.core.config').ft_strict_disabled, lang)
        end,
        paint_arg_declarations = true,
        paint_arg_usages = true,
        paint_catch_blocks = {
            declarations = false,
            usages = false,
        },
        extras = {
            named_parameters = true,
        },
        hl_priority = 10000,
        excluded_argnames = {
            declarations = {},
            usages = {
                python = { 'self', 'cls' },
                lua = { 'self' },
            },
        },
        performance = {
            parse_delay = 1,
            slow_parse_delay = 50,
            max_iterations = 400,
            max_concurrent_partial_parses = 50,
            debounce = {
                partial_parse = 3,
                partial_insert_mode = 100,
                total_parse = 700,
                slow_parse = 5000,
            },
        },
    })
end

return M
