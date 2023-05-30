---@class LazyPlugin
local M = {
    'folke/noice.nvim',
    event = 'VeryLazy',
}

function M.config()
    require('noice').setup({
        cmdline = {
            view = 'cmdline',
            format = {
                IncRename = {
                    view = 'cmdline_popup',
                },
            },
        },
        messages = {
            enabled = true,
        },
        lsp = {
            progress = {
                enabled = false,
            },
            signature = {
                enabled = true,
            },
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true,
            },
        },
        presets = {
            inc_rename = true,
            bottom_search = false,
            long_message_to_split = true,
            lsp_doc_border = true,
            command_palette = false,
        },
        routes = {
            -- TODO: what the fuck, make this work, try dressing
            {
                filter = { kind = 'overseer_template' },
                view = 'popup',
            },
        },
    })
end

return M
