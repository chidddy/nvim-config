-- originally authored by @AdamWhittingham
-- modified by chiddy
-- requires projects.nvim
-- TODO: redo, remove projects.nvim requirement

local plenary_path = require('plenary.path')
local dashboard = require('alpha.themes.dashboard')
-- local icons = require('chiddy.utils.icons')
local icons = require('chiddy.new_utils.icons')
-- local nwd = require('nvim-web-devicons')

local function file_button(fn, sc, short_fn, autocd)
    short_fn = short_fn or fn
    -- local ico_txt
    local fb_hl = {}
    -- local ico, hl = nwd.get_icon(fn, ext, { default = true })
    local ico = string.format('%s ', icons.ui.documents.file_alt)
    local hl = 'CursorLineFold'
    table.insert(fb_hl, { hl, 0, 3 })
    local cd_cmd = (autocd and ' | cd %:p:h' or '')
    local file_button_el = dashboard.button(sc, ico .. short_fn, '<cmd>e ' .. fn .. cd_cmd .. ' <CR>')
    local fn_start = short_fn:match('.*[/\\]')
    if fn_start ~= nil then
        table.insert(fb_hl, { 'Conceal', #ico - 2, #fn_start + #ico })
    end
    file_button_el.opts.hl = fb_hl
    return file_button_el
end

local function mru()
    local target_width = 35

    local tbl = {}
    local projs = require('project_nvim').get_recent_projects()
    for i = 1, #projs do
        local fn = projs[i]
        if i > 10 then
            break
        end
        local short_fn = vim.fn.fnamemodify(fn, ':~')

        if #short_fn > target_width then
            short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
            if #short_fn > target_width then
                short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
            end
        end

        local shortcut = tostring(i)

        local file_button_el = file_button(fn, shortcut, short_fn, true)
        tbl[i] = file_button_el
    end
    return { {
        type = 'group',
        val = tbl,
        opts = {},
    } }
end

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

local section_mru = {
    type = 'group',
    val = {
        {
            type = 'text',
            val = 'recent projects',
            opts = {
                hl = 'SpecialComment',
                shrink_margin = false,
                position = 'center',
            },
        },
        { type = 'padding', val = 1 },
        {
            type = 'group',
            val = mru,
            opts = { shrink_margin = false },
        },
    },
}

local buttons = {
    type = 'group',
    val = {
        { type = 'text', val = 'actions', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button(
            'w',
            string.format('%s  open here', icons.ui.documents.folder.closed.full),
            ':Neotree current .<CR>'
        ),
        dashboard.button('e', string.format('%s  new file', icons.ui.documents.file), ':ene<CR>'),
        dashboard.button(
            'f',
            string.format('%s  find file', icons.ui.controls.search.file),
            ':Telescope find_files<CR>'
        ),
        dashboard.button(
            'c',
            string.format('%s  config', icons.misc.gear),
            ':cd ~/.config/nvim/ | Neotree current .<CR>'
        ),
        dashboard.button('p', string.format('%s  plugins', icons.ui.download), ':Lazy home<CR>'),
        dashboard.button('q', string.format('%s  exit', icons.ui.controls.signout), ':qa<CR>'),
    },
    opts = {
        hl = 'Keyword',
        position = 'center',
    },
}

local function footer_text()
    local stats = require('lazy').stats()
    local datetime = os.date('%H:%M:%S %d-%m-%Y')
    local version = vim.version()
    local ret = string.format(
        ' %s %s plugins %s v%s.%s.%s %s %s %s %.3fms',
        icons.misc.plugins,
        stats.count,
        icons.misc.vim,
        version.major,
        version.minor,
        version.patch,
        icons.misc.clock,
        datetime,
        icons.misc.clock,
        stats.times.LazyDone
    )
    -- local plugins_text = ' '
    --     .. icons.misc.plugins
    --     .. ' '
    --     .. stats.count
    --     .. ' plugins '
    --     .. icons.misc.vim
    --     .. ' v'
    --     .. vim.version().major
    --     .. '.'
    --     .. vim.version().minor
    --     .. '.'
    --     .. vim.version().patch
    --     .. ' '
    --     .. icons.misc.clock
    --     .. ' '
    --     .. datetime
    --     .. ' '
    --     .. icons.misc.clock
    --     .. ' '
    --     .. stats.times.LazyDone
    --     .. 'ms'
    return ret
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

local head_butt_padding = 1
local occu_height = #header.val + 4 * #buttons.val + 4
local header_padding = math.max(0, math.ceil((vim.fn.winheight('$') - occu_height) * 0.25))
local foot_butt_padding = 4

local layout = {
    { type = 'padding', val = header_padding },
    header,
    { type = 'padding', val = head_butt_padding },
    section_mru,
    { type = 'padding', val = foot_butt_padding },
    buttons,
    { type = 'padding', val = foot_butt_padding },
    footer,
}

return layout
