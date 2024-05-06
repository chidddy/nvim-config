local M = {
    personal = {
        username = 'chiddy',
        email = 'chiddy@chiddy.xyz',
        github = 'chidddy',
    },
    urls = {
        protocol = 'https://',
        github = 'github.com',
        twitter = 'twitter.com',
        personal = 'chiddy.xyz',
    },
    home = '/home/chiddy',
    projects = '/projects',
    obsidian = 'syncthing/obsidian/first',
    locals = '/projects/lua/nvim/',
    palette = 'catppuccin',
    theme = 'basic',
    lsp = {
        servers = {
            system = {
                -- 'efm',
                'lua_ls',
                'rust_analyzer',
            },
            installer = {
                'bashls',
                -- 'biome',
                'clangd',
                'cmake',
                'cssls',
                'gopls',
                'html',
                'jsonls',
                'lemminx',
                'marksman',
                -- 'quick_lint_js',
                'svelte',
                -- 'taplo',
                'texlab',
                'tsserver',
                'typst_lsp',
                'yamlls',
                'zls',
            },
        },
        format_on_save = true,
    },
    dap = {
        adapters = {
            'cppdbg',
            'codelldb',
        },
        configs = {},
    },
    dashboard_hide_cursor = true,
    ft = {
        quick_close = {
            'OverseerList',
            'PlenaryTestPopup',
            'Trouble',
            'help',
            'lspinfo',
            'man',
            'neotest-output',
            'neotest-output-panel',
            'neotest-summary',
            'noice',
            'notify',
            'qf',
            'spectre_panel',
            'startuptime',
            'tsplayground',
        },
        dashboard = {
            'Alpha',
            'Dashboard',
            'Mason',
            'alpha',
            'dashboard',
            'lazy',
        },
        disable_visuals = {
            'Alpha',
            'Mason',
            'NvimTree',
            'Outline',
            'TelescopePrompt',
            'Trouble',
            'alpha',
            'dashboard',
            'fugitive',
            'lazy',
            'neo-tree',
            'noice',
        },
    },
    bt = {
        disable_visuals = {
            'checkhealth',
            'help',
            'nofile',
            'prompt',
            'quickfix',
        },
    },
    textobjects = {
        remaps = {
            c = '}', -- [c]urly brace
            r = ']', -- [r]ectangular bracket
            b = ')', -- [b]racket
            m = 'W', -- [m]assive word
            q = '"', -- [q]uote
            z = "'", -- [z]ingle quote
            e = '`', -- t[e]mplate string / inline cod[e]
        },
        maps = {
            ['function'] = 'f',
            ['conditional'] = 'o',
            ['call'] = 'l',
            ['doubleSquareBracket'] = 'R',
        },
    },
}
return M
