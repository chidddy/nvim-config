---@class LazyPlugin
local M = {
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
}

function M.config()
    local icons = require('chiddy.utils.icons')
    local ccc = require('ccc')
    local picker = ccc.picker
    local input = ccc.input
    local output = ccc.output
    ccc.setup({
        default_color = '#000000',
        bar_char = icons.sep.Block,
        point_char = icons.ui.Indicator,
        highlighter = {
            lsp = true,
            auto_enable = true,
        },
        pickers = {
            picker.hex,
            picker.css_rgb,
            picker.css_hsl,
            picker.css_hwb,
            picker.css_lab,
            picker.css_lch,
            picker.css_oklab,
            picker.css_oklch,
            picker.custom_entries(require('chiddy.ui.colors').clone_flat()),
            picker.ansi_escape(),
        },
        inputs = {
            input.rgb,
            input.hsl,
            input.cmyk,
            input.hsluv,
            input.oklch,
            input.okhsl,
        },
        outputs = {
            output.hex,
            output.hex_short,
            output.css_rgb,
            output.css_hsl,
            output.float,
        },
    })
end

return M
