---@class LazyPlugin
local M = {
    'folke/noice.nvim',
}
M.event = 'VeryLazy'
function M.config()
    require('noice').setup({
        cmdline = {
            view = 'cmdline',
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
        -- routes = {
        -- {
        --     view = 'split',
        --     filter = {
        --         kind = 'msg_show',
        --         find = 'map',
        --     },
        -- },
        -- },
        -- redirect = {
        --     view = 'notify',
        --     filter = {
        --         kind = 'msg_show',
        --     },
        -- },
        presets = {
            inc_rename = true,
            bottom_search = false,
            long_message_to_split = true,
            lsp_doc_border = true,
            command_palette = false,
        },
    })
    -- require('telescope').load_extension('noice')
end

return M
