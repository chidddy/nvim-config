---@class LazyPlugin
local M = {
    'shellRaining/hlchunk.nvim',
    event = 'VeryLazy',
}

function M.config()
    require('hlchunk').setup({
        -- config
        chunk = {
            enable = false,
            use_treesitter = false,
            chars = {
                horizontal_line = '',
                vertical_line = '│',
                left_top = '│',
                left_bottom = '│',
                right_arrow = '',
            },
            style = '#94e2d5',
        },
        indent = {
            enable = true,
            use_treesitter = false,
            style = {
                '#89b4fa',
            },
            exclude_filetype = {
                alpha = true,
                lazy = true,
                dashboard = true,
                help = true,
                lspinfo = true,
                packer = true,
                checkhealth = true,
                man = true,
                mason = true,
                NvimTree = true,
                plugin = true,
            },
        },
        line_num = {
            enable = false,
            use_treesitter = false,
        },
        blank = {
            enable = false,
        },
    })
end

return M
