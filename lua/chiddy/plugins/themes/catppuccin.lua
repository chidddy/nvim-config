---@class LazyPlugin
local M = {
    'catppuccin/nvim',
    lazy = true,
    enabled = true,
    event = 'VeryLazy',
    priority = 10000,
    name = 'catppuccin',
}

function M.config()
    local ucolors = require('chiddy.utils.colors')
    local clrs = require('catppuccin.palettes').get_palette('mocha')
    require('catppuccin').setup({
        flavour = 'mocha',
        transparent_background = true,
        term_colors = true,
        compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
        color_overrides = {
            all = {
                surface2 = ucolors.darken(clrs.surface2, 0.4),
                overlay2 = ucolors.lighten(clrs.overlay2, 0.6),
            },
        },
        dim_inactive = {
            enabled = false,
            shade = 'dark',
            percentage = 0.15,
        },
        -- styles = {
        --     comments = { 'italic' },
        --     conditionals = { 'italic' },
        -- },
        integrations = {
            alpha = true,
            cmp = true,
            dap = {
                enabled = true,
                enable_ui = true,
            },
            gitsigns = true,
            illuminate = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            lsp_trouble = true,
            mason = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { 'italic' },
                    hints = { 'italic' },
                    warnings = { 'italic' },
                    information = { 'italic' },
                },
                -- underlines = {
                --     errors = { 'underline' },
                --     hints = { 'underline' },
                --     warnings = { 'underline' },
                --     information = { 'underline' },
                -- },
            },
            navic = {
                enabled = true,
                custom_bg = clrs.crust,
            },
            neotree = true,
            noice = true,
            notify = true,
            semantic_tokens = true,
            treesitter = true,
            treesitter_context = true,
            telescope = true,
            ts_rainbow2 = true,
            which_key = true,
        },
        custom_highlights = function(colors)
            -- vim.api.nvim_set_hl(0, 'Comment', )
            local overlay0 = ucolors.darken(colors.overlay0, 0.3)
            return {
                CursorLine = { bg = 'NONE' },
                -- CursorLineNr = { fg = colors.lavender },
                NormalSB = { bg = 'NONE' },
                LineNr = { fg = overlay0 },
                TreesitterContextLineNumber = { fg = overlay0 },
                Comment = { fg = overlay0 },
                MatchParen = { bg = 'NONE' },
                DiagnosticVirtualTextError = { bg = 'NONE' },
                DiagnosticVirtualTextWarn = { bg = 'NONE' },
                DiagnosticVirtualTextInfo = { bg = 'NONE' },
                DiagnosticVirtualTextHint = { bg = 'NONE' },
                Pmenu = { fg = colors.mauve },
                -- ['@punctuation.delimiter'] = { fg = ucolors.lighten(colors.overlay2, 0.6) },
                -- LspInlayHint = { bg = colors.none },
            }
        end,
    })
    vim.cmd([[colorscheme catppuccin]])
end

return M
