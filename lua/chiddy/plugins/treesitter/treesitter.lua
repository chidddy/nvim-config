---@class LazyPlugin
local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
}

M.dependencies = {
    { 'nvim-treesitter/playground' },
    { 'drybalka/tree-climber.nvim' },
    { 'windwp/nvim-ts-autotag' },
    { 'RRethy/nvim-treesitter-endwise' },
    { 'RRethy/nvim-treesitter-textsubjects' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'HiPhish/rainbow-delimiters.nvim' },
}

function M.config()
    require('nvim-treesitter.configs').setup({
        auto_install = true,
        ensure_installed = 'all',
        sync_install = false,
        autopairs = {
            enable = false,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true, disable = { 'python', 'css' } },
        playground = {
            enabled = true,
            updatetime = 50,
            persist_queries = true,
        },
        matchup = {
            enabled = true,
        },
        query_linter = {
            enable = false,
            use_virtual_text = true,
            lint_events = { 'BufWrite', 'CursorHold' },
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gs',
                node_incremental = 'gs',
                node_decremental = 'gS',
                scope_incremental = 'gd',
            },
        },
        textsubjects = {
            enable = true,
            prev_selection = ',',
            keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = 'textsubjects-container-inner',
            },
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        -- rainbow = {
        --     enable = true,
        --     query = {
        --         'rainbow-parens',
        --     },
        --     strategy = require('ts-rainbow.strategy.global'),
        --     hlgroups = {
        --         'rainbowcol1',
        --         'rainbowcol2',
        --         'rainbowcol3',
        --         'rainbowcol4',
        --         'rainbowcol5',
        --         'rainbowcol6',
        --         'rainbowcol7',
        --     },
        -- },
        autotag = {
            enable = true,
        },
        endwise = {
            enable = true,
        },
    })
    -- vim.g.rainbow_delimiters = {
    --
    -- }
end

return M
