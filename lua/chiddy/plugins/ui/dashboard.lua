---@class LazyPlugin
local plugin = {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    enabled = false,
}

function plugin.config()
    require('dashboard').setup({
        theme = 'doom',
        config = {
            header = {
                '                                   ',
                '                                   ',
                '                                   ',
                '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ',
                '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
                '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
                '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
                '          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
                '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
                '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
                ' ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
                ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
                '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
                '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
                '                                   ',
            },
            disable_move = false,
            week_header = {
                enable = false,
            },
            -- shortcut = {
            --     {
            --         icon = ' ',
            --         icon_hl = '@property',
            --         desc = 'update',
            --         group = '@property',
            --         action = 'Lazy update',
            --         key = 'u',
            --     },
            --     {
            --         icon = ' ',
            --         icon_hl = '@variable',
            --         desc = 'plugins',
            --         group = 'Label',
            --         action = 'Lazy home',
            --         key = 'p',
            --     },
            --     {
            --         icon = ' ',
            --         icon_hl = '@variable',
            --         desc = 'quit',
            --         group = 'Label',
            --         action = ':qa',
            --         key = 'q',
            --     },
            -- },
            center = {
                {
                    icon = ' ',
                    icon_hl = 'Title',
                    desc = 'Find File           ',
                    desc_hl = 'String',
                    key = 'b',
                    keymap = 'SPC f f',
                    key_hl = 'Number',
                    action = 'lua print(2)',
                },
                {
                    icon = ' ',
                    desc = 'quit',
                    key = 'q',
                    -- keymap = '',
                    action = ':qa',
                },
            },
            footer = {}, -- footer
        },
    })
end

-- dashboard.button('w', icons.ui.Folder .. '  open here', ':e .<CR>'),
-- dashboard.button('e', icons.ui.NewFile .. '  new file', ':ene<CR>'),
-- dashboard.button('f', icons.ui.SearchFile .. '  find file', ':Telescope find_files<CR>'),
-- dashboard.button('p', icons.git.Repo .. '  open project', ':Telescope projects<CR>'),
-- dashboard.button('c', icons.ui.Gear .. '  configuration', ':e ~/.config/nvim/<CR>'),
-- dashboard.button('u', icons.ui.CloudDownload .. '  plugins', ':Lazy home<CR>'),
-- dashboard.button('q', icons.ui.SignOut .. '  quit', ':qa<CR>'),
return plugin
