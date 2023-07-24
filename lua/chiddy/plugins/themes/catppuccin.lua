---@class LazyPlugin
local M = {
    'catppuccin/nvim',
    event = 'VeryLazy',
    name = 'catppuccin',
}

function M.config()
    local clrs = require('catppuccin.palettes').get_palette('mocha')
    local cutils = require('chiddy.utils.colors')
    local funcs = cutils.funcs

    require('catppuccin').setup({
        flavour = 'mocha',
        transparent_background = true,
        term_colors = true,
        compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
        color_overrides = {
            all = {
                surface2 = cutils.modify(clrs.surface2, { l = funcs.minus(23.6), c = funcs.div(2) }),
                -- surface2 = cutils.chroma(
                --     cutils.lightness(clrs.surface2, cutils.funcs.minus(23.6), cutils.funcs.div(2))
                -- ),
                -- overlay2 = cutils.chroma(
                --     cutils.lightness(clrs.overlay2, cutils.funcs.add(15)),
                --     cutils.funcs.minus(1.6)
                -- ),
                overlay2 = cutils.modify(clrs.overlay2, { l = funcs.add(15), c = funcs.minus(1.6) }),
            },
        },
        dim_inactive = {
            enabled = false,
            shade = 'dark',
            percentage = 0.15,
        },
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
                underlines = {
                    errors = { 'underline' },
                    hints = { 'underline' },
                    warnings = { 'underline' },
                    information = { 'underline' },
                },
            },
            navic = {
                enabled = true,
                custom_bg = clrs.crust,
            },
            neogit = true,
            neotree = true,
            noice = true,
            notify = true,
            nvimtree = true,
            overseer = true,
            rainbow_delimiters = true,
            semantic_tokens = true,
            treesitter = true,
            treesitter_context = true,
            telescope = true,
            ts_rainbow2 = true,
            which_key = true,
        },
        highlight_overrides = {
            mocha = function(colors)
                local overlay0 =
                    cutils.modify(colors.overlay0, { l = funcs.minus(32.7), c = funcs.minus(2.4), h = funcs.minus(7) })
                return {
                    CursorLine = { bg = 'NONE' },
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
                }
            end,
        },
    })
    require('catppuccin').load()
    vim.api.nvim_exec_autocmds('Colorscheme', {})
end

function M.colors()
    local clrs = require('catppuccin.palettes').get_palette('mocha')
    return {
        red = clrs.red,
        blue = clrs.blue,
        green = clrs.green,
        yellow = clrs.yellow,
        orange = clrs.peach,
        purple = clrs.mauve,
        cyan = clrs.sky,
        teal = clrs.teal,
        gray = clrs.overlay0,
        bg = clrs.base,
        bg_dark = clrs.crust,
        text = clrs.text,
        text_dark = clrs.surface0,
        modes = {
            normal = clrs.blue,
            insert = clrs.green,
            visual = clrs.mauve,
            delete = clrs.red,
            copy = clrs.blue,
        },
        git = {
            added = clrs.green,
            changed = clrs.yellow,
            removed = clrs.red,
        },
        diag = {
            error = clrs.red,
            warn = clrs.yellow,
            info = clrs.sky,
            hint = clrs.teal,
        },
        main = clrs.blue,
        secondary = clrs.sky,
    }
end

return M
