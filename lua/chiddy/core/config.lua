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
    locals = '/projects/lua/nvim/',
    palette = 'catppuccin',
    theme = 'basic',
    ft_strict_disabled = {
        'Trouble',
        'alpha',
        'Alpha',
        'TelescopePrompt',
        'Outline',
        'help',
        'checkhealth',
        'packer',
        'dashboard',
        'Mason',
        'lazy',
    },
    bt_strict_disabled = {},
    lsp = {
        servers = {
            system = {
                'clangd',
                'lua_ls',
            },
            installer = {
                'bashls',
                'cmake',
                'rust_analyzer',
                'gopls',
                'tsserver',
                'typst_lsp',
                'yamlls',
                'lemminx',
                'jsonls',
                'taplo',
            },
        },
        format_on_save = true,
    },
    dashboard_hide_cursor = true,
    dashboard_ft = {
        'alpha',
        'Alpha',
        'dashboard',
        'Dashboard',
    },
}

return M
