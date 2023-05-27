-- originally authored by @AdamWhittingham
-- modified by chiddy
-- requires projects.nvim

local plenary_path = require('plenary.path')
local dashboard = require('alpha.themes.dashboard')
local icons = require('chiddy.utils.icons')
local if_nil = vim.F.if_nil

local nvim_web_devicons = {
    enabled = true,
    highlight = true,
}

local function get_extension(fn)
    local match = fn:match('^.+(%..+)$')
    local ext = ''
    if match ~= nil then
        ext = match:sub(2)
    end
    return ext
end

local function icon(fn)
    local nwd = require('nvim-web-devicons')
    local ext = get_extension(fn)
    return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn, autocd)
    short_fn = short_fn or fn
    local ico_txt
    local fb_hl = {}

    if nvim_web_devicons.enabled then
        local ico, hl = icon(fn)
        local hl_option_type = type(nvim_web_devicons.highlight)
        if hl_option_type == 'boolean' then
            if hl and nvim_web_devicons.highlight then
                table.insert(fb_hl, { hl, 0, 3 })
            end
        end
        if hl_option_type == 'string' then
            table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
        end
        ico_txt = ico .. '  '
    else
        ico_txt = ''
    end
    local cd_cmd = (autocd and ' | cd %:p:h' or '')
    local file_button_el = dashboard.button(sc, ico_txt .. short_fn, '<cmd>e ' .. fn .. cd_cmd .. ' <CR>')
    local fn_start = short_fn:match('.*[/\\]')
    if fn_start ~= nil then
        table.insert(fb_hl, { 'Conceal', #ico_txt - 2, #fn_start + #ico_txt })
    end
    file_button_el.opts.hl = fb_hl
    return file_button_el
end

local default_mru_ignore = { 'gitcommit' }

local mru_opts = {
    ignore = function(path, ext)
        return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
    end,
    autocd = false,
}

--- @param start number
--- @param items_number number? optional number of items to generate, default = 10
local function mru(start, items_number, opts)
    opts = opts or mru_opts
    items_number = if_nil(items_number, 10)
    local target_width = 35

    local tbl = {}
    local projs = require('project_nvim').get_recent_projects()
    for i = 1, #projs do
        local fn = projs[i]
        if i > items_number then
            break
        end
        local short_fn = vim.fn.fnamemodify(fn, ':~')

        if #short_fn > target_width then
            short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
            if #short_fn > target_width then
                short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
            end
        end

        local shortcut = tostring(i + start - 1)

        local file_button_el = file_button(fn, shortcut, short_fn, opts.autocd)
        tbl[i] = file_button_el
    end
    return {
        type = 'group',
        val = tbl,
        opts = {},
    }
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
            val = function()
                return { mru(1) }
            end,
            opts = { shrink_margin = false },
        },
    },
}

local buttons = {
    type = 'group',
    val = {
        { type = 'text', val = 'actions', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button('w', icons.ui.Folder .. '  open here', '<cmd>cd .<CR><cmd>e .<CR>'),
        dashboard.button('e', icons.ui.NewFile .. '  new file', '<cmd>ene<CR>'),
        dashboard.button('f', icons.ui.SearchFile .. '  find file', '<cmd>Telescope find_files<CR>'),
        dashboard.button('p', icons.git.Repo .. '  open project', '<cmd>Telescope projects<CR>'),
        dashboard.button('c', icons.ui.Gear .. '  configuration', '<cmd>cd ~/.config/nvim/<CR><cmd>e .<CR>'),
        dashboard.button('u', icons.ui.CloudDownload .. '  plugins', '<cmd>Lazy home<CR>'),
        dashboard.button('q', icons.ui.SignOut .. '  quit', '<cmd>qa<CR>'),
    },
    opts = {
        hl = 'Keyword',
        position = 'center',
    },
}

local function footer_text()
    local total_plugins = 0
    total_plugins = require('lazy').stats().count
    local datetime = os.date('%H:%M:%S %d-%m-%Y')
    local plugins_text = ' '
        .. icons.misc.Plug
        .. ' '
        .. total_plugins
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

local head_butt_padding = 1
local occu_height = #header.val + 4 * #buttons.val + 4
local header_padding = math.max(0, math.ceil((vim.fn.winheight('$') - occu_height) * 0.25))
local foot_butt_padding = 4

local config = {
    layout = {
        { type = 'padding', val = header_padding },
        header,
        { type = 'padding', val = head_butt_padding },
        section_mru,
        { type = 'padding', val = foot_butt_padding },
        buttons,
        { type = 'padding', val = foot_butt_padding },
        footer,
    },
    opts = {
        margin = 5,
        noautocmd = true,
        keymap = {
            press = '<CR>',
            queue_press = '<M-CR>',
        },
    },
}

return {
    header = header,
    buttons = buttons,
    mru_opts = mru_opts,
    footer = footer,
    nvim_web_devicons = nvim_web_devicons,
    config = config,
}
