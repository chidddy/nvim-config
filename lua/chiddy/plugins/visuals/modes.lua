---@class LazyPlugin
local M = {
    'mvllow/modes.nvim',
    event = 'ModeChanged',
}
function M.config()
    local modes = require('modes')
    local color = require('catppuccin.palettes.mocha')
    local ucolor = require('chiddy.utils.colors')
    local cfg = {
        colors = {
            insert = color.green,
            visual = color.mauve,
            delete = color.red,
            copy = color.blue,
        },
        line_opacity = 0.6,
        set_cursor = true,
        set_cursorline = true,
        set_number = true,
        ignore_filetypes = { 'Mason', 'TelescopePrompt', 'neo-tree', 'neo-tree-prompt', 'neo-tree-preview', 'NvimTree' },
    }
    modes.define = function()
        local base = '#0f0f0f'

        for _, mode in ipairs({ 'Copy', 'Delete', 'Insert', 'Visual' }) do
            local def = { bg = ucolor.blend(cfg.colors[mode:lower()], base, cfg.line_opacity), default = true }
            local norm = { fg = cfg.colors[mode:lower()], default = true }
            vim.api.nvim_set_hl(0, ('Modes%s'):format(mode), { bg = norm.fg, default = true })
            vim.api.nvim_set_hl(0, ('Modes%sCursorLine'):format(mode), def)
            vim.api.nvim_set_hl(0, ('Modes%sCursorLineNr'):format(mode), norm)
            vim.api.nvim_set_hl(0, ('Modes%sCursorLineSign'):format(mode), norm)
            vim.api.nvim_set_hl(0, ('Modes%sCursorLineFold'):format(mode), norm)
            -- utils.hi(('Modes%s'):format(mode), { bg = norm.fg }, true)
            -- utils.hi(('Modes%sCursorLine'):format(mode), def, true)
            --     utils.hi(('Modes%sCursorLineNr'):format(mode), norm, true)
            --     utils.hi(('Modes%sCursorLineSign'):format(mode), norm, true)
            --     utils.hi(('Modes%sCursorLineFold'):format(mode), norm, true)
        end

        vim.api.nvim_set_hl(0, 'ModesInsertModeMsg', { fg = cfg.colors.insert, default = true })
        vim.api.nvim_set_hl(0, 'ModesVisualModeMsg', { fg = cfg.colors.visual, default = true })
        vim.api.nvim_set_hl(
            0,
            'ModesVisualVisual',
            { bg = ucolor.blend(cfg.colors.visual, base, cfg.line_opacity), default = true }
        )
        -- utils.hi('ModesInsertModeMsg', { fg = cfg.colors.insert })
        -- utils.hi('ModesVisualModeMsg', { fg = cfg.colors.visual })
        -- utils.hi('ModesVisualVisual', { bg = ucolor.blend(cfg.colors.visual, base, cfg.line_opacity) })
    end

    modes.setup(cfg)
end

return M
