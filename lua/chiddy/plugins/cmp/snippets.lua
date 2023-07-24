---@class LazyPlugin
local M = {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    dependencies = {
        { 'rafamadriz/friendly-snippets' },
        {
            'madskjeldgaard/cheeky-snippets.nvim',
            opts = {
                langs = {
                    all = true,
                    lua = true,
                    cpp = true,
                    asm = true,
                    cmake = true,
                    markdown = true,
                },
            },
        },
    },
}

function M.config()
    local types = require('luasnip.util.types')
    local snip = require('luasnip')
    local icons = require('chiddy.utils.icons')
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets/' })
    snip.filetype_extend('typescript', { 'javascript' })
    snip.filetype_extend('javascriptreact', { 'javascript' })
    snip.filetype_extend('typescriptreact', { 'typescript' })
    snip.setup({
        history = true,
        region_check_events = 'CursorMoved,CursorHold,InsertEnter',
        delete_check_events = 'InsertLeave, TextChanged',
        enable_autosnippets = true,
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    hl_mode = 'combine',
                    virt_text = { { icons.cmp.luasnip, 'Operator' } },
                },
            },
            [types.insertNode] = {
                active = {
                    hl_mode = 'combine',
                    virt_text = { { icons.cmp.luasnip, 'Type' } },
                },
            },
        },
    })
    require('telescope').load_extension('luasnip')
end

return M
