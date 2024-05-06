local dashboard = require('alpha.themes.dashboard')
local icons = require('chiddy.utils.icons')

local header = {
    type = 'text',
    val = {
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
    opts = {
        position = 'center',
        hl = 'Include',
    },
}

-- TODO: use string.format its faster
local function footer_text()
    local stats = require('lazy').stats()
    local datetime = os.date('%H:%M:%S %d-%m-%Y')
    local plugins_text = ' '
        .. icons.misc.Plug
        .. ' '
        .. stats.count
        .. ' plugins '
        .. icons.misc.VIM
        .. ' v'
        .. vim.version().major
        .. '.'
        .. vim.version().minor
        .. '.'
        .. vim.version().patch
        .. ' '
        .. icons.ui.Clock
        .. ' '
        .. datetime
        .. ' '
        .. icons.ui.Clock
        .. ' '
        .. stats.times.LazyDone
        .. 'ms'
    return plugins_text
end

local footer = {
    type = 'group',
    val = {
        { type = 'text', val = footer_text(), opts = { position = 'center', hl = 'Conceal' } },
        { type = 'text', val = 'https://chiddy.xyz', opts = { position = 'center', hl = 'Conceal' } },
    },
    opts = {
        position = 'center',
        hl = 'Function',
    },
}

local buttons = {
    type = 'group',
    val = {
        { type = 'text', val = 'actions', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button('w', icons.ui.Folder .. '  open here', ':e .<CR>'),
        dashboard.button('e', icons.ui.NewFile .. '  new file', ':ene<CR>'),
        dashboard.button('f', icons.ui.SearchFile .. '  find file', ':Telescope find_files<CR>'),
        dashboard.button('c', icons.ui.Gear .. '  configuration', ':e ~/.config/nvim/<CR>'),
        dashboard.button('p', icons.ui.CloudDownload .. '  plugins', ':Lazy home<CR>'),
        dashboard.button('q', icons.ui.SignOut .. '  quit', ':qa<CR>'),
    },
    opts = {
        hl = 'Keyword',
        position = 'center',
    },
}

local head_butt_padding = 1
local occu_height = #header.val + 4 * #buttons.val + 4
local header_padding = math.max(0, math.ceil((vim.fn.winheight('$') - occu_height) * 0.25))
local foot_butt_padding = 4

local layout = {
    { type = 'padding', val = header_padding },
    header,
    { type = 'padding', val = head_butt_padding },
    buttons,
    { type = 'padding', val = foot_butt_padding },
    footer,
}

return layout
