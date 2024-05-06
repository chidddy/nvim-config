local ui = {}

---@class ui_borders
local borders = {
    dash_rounded = {
        chars = { '┄', '┊', '┄', '┊', '╭', '╮', '╯', '╰' },
        horizontal = '┄',
        vertical = '┊',
    },
    dash = {
        chars = { '┄', '┊', '┄', '┊', '┌', '┐', '┘', '└' },
        horizontal = '┄',
        vertical = '┊',
    },
    single = {
        chars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        horizontal = '─',
        vertical = '│',
    },
    double = {
        chars = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
        horizontal = '═',
        vertical = '║',
    },
    rounded = {
        chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        horizontal = '─',
        vertical = '│',
    },
}

---@class ui_icons
local icons = {
    git = {
        add = '',
        change = '',
        remove = '',
        ignore = '',
        rename = '',
        unstage = { '', '' },
        stage = { '', '' },
        branch = '󰘬',
        diff = '',
        repo = '',
        ahead = '⇡',
        behind = '⇣',
    },
    chevron = {
        up = { '', '' },
        down = { '', '' },
        left = { '', '' },
        right = { '', '' },
        double = {
            up = '󰄿',
            down = '',
            left = '󰄽',
            right = '󰄾',
        },
    },
    -- TODO: finish new DAP icons
    dap = {
        points = {
            breakpoint = { 'ß', '' },
            condition = { 'ﳁ', '' },
            rejected = { '', '' },
            log = { '', '' },
        },
        pause = { '', '' },
        play = { '', '' },
        quit = { 'ﱢ', '' },
        run_last = { '↻', '' },
        stopped = { '', '' },
        step = {
            into = { '', '' },
            back = { '', '' },
            out = { '', '' },
            over = { '', '' },
        },
    },
    diag = {
        error = { '', '' },
        warn = { '', '' },
        info = { '', '' },
        hint = { '', '' },
        other = { '', '' },
    },
    kind = {
        -- Class = "",
        -- Class = 'ﴯ',
        Class = '',
        Color = '',
        Constant = '',
        -- Constructor = "",
        Constructor = '',
        Enum = '',
        EnumMember = '',
        Event = '',
        Field = '',
        File = '',
        Folder = '',
        Function = '',
        Interface = '',
        -- Keyword = "",
        Keyword = '',
        Method = '',
        -- Module = '',
        Module = '',
        Namespace = '',
        Number = '#',
        Operator = '',
        -- Package = '',
        Package = '',
        Property = 'ﰠ',
        Reference = '',
        -- Snippet = '',
        Snippet = '',
        Struct = '',
        Text = '',
        TypeParameter = '',
        Unit = '',
        Value = '',
        Variable = '',
        -- ccls-specific icons.
        TypeAlias = '',
        Parameter = '',
        StaticMethod = '',
        Macro = '',
    },
    sep = {
        left = {
            arrow = { '', '' },
            rounded = { '', '' },
            slant = { '', '' },
            slant_top = { '', '' },
        },
        right = {
            arrow = { '', '' },
            rounded = { '', '' },
            slant = { '', '' },
            slant_top = { '', '' },
        },
        bar = {
            thick = '█',
            normal = '┃',
            thin = '│',
        },
    },
    ui = {
        documents = {
            file = { '', '' },
            bookmark = '',
            project = { '󰂺', '󰭤' },
            repo = '',
            folder = {
                open = {
                    full = '',
                    empty = '',
                },
                closed = {
                    empty = '',
                    full = '',
                },
            },
            symlink = {
                file = '',
                folder = '',
            },
        },
        controls = {
            search = {
                text = '',
                file = '',
            },
            signin = { '', '󰍂' },
            signout = { '', '󰍃' },
            sort = {
                letters = {
                    asc = '󰖽',
                    desc = '󰖿',
                },
                size = {
                    asc = '󰒼',
                    desc = '󰒽',
                },
                number = {
                    asc = '󱎉',
                    desc = '󱎊',
                },
            },
            spell = '󰓆',
        },
        cross = { '', '' },
        plus = { '', '' },
        check = { '', '' },
        table = '',
        truncate = '…',
        trash = 'ﮁ',
        download = '',
        comment = '',
        list = '',
        lock = '',
        note = '',
    },
    misc = {
        arrow = {
            left = {
                circle = { '', '' },
                square = { '󰜲', '󰜳' },
                normal = { '󰜱', '󰧀' },
            },
            right = {
                circle = { '', '' },
                square = { '󰜵', '󰜶' },
                normal = { '󰜴', '󰧂' },
            },
            up = {
                circle = { '', '' },
                square = { '󰜸', '󰜹' },
                normal = { '󰜷', '󰧇' },
            },
            down = {
                circle = { '', '' },
                square = { '󰜯', '󰜰' },
                normal = { '󰜮', '󰦿' },
            },
        },
        light = {
            on = { 'ﯦ', 'ﯧ' },
            off = { '', '' },
        },
        bracket = {
            right = '❯',
            left = '❮',
        },
        lock = '',
        package = '',
        calendar = '',
        pencil = '',
        telescope = '',
        clock = '',
        document = '',
        bell = {
            normal = { '󰂚', '󰂜' },
            cross = { '󰂛', '󰪑' },
        },
        wind = '',
        emoji = '',
        fire = '',
        gear = '',
        circle = {
            filled = '',
            empty = '',
            dot = '•',
            dot_outline = '',
        },
        bug = '',
        campass = '',
        code = '',
        gavel = '',
        glass = '',
        plugins = '',
        tag = '',
        terminal = '',
        tree = '',
        vim = '',
        ghost = '',
        person = '',
        slash = '',
    },
}

local function iterate_groups(tbl, group, item)
    -- if not tbl[group] then
    --     tbl[group] = {}
    -- end
    return vim.iter(item):fold(nil, function(_, k, v)
        -- if not tbl[group] then
        --     tbl[group] = {}
        -- end
        if type(v) == 'string' then
            tbl[group][k] = v
        else
            -- if vim.tbl_isarray(v) then
            if v[1] then
                tbl[group][k] = v[1]
                tbl[group][k .. '_alt'] = v[2]
            else
                iterate_groups(tbl[group], k, v)
            end
        end
        return tbl
    end)
end

---@type ui_borders
ui.borders = borders

---@type ui_icons
-- ui.icons = vim.iter(icons):fold({}, function(acc, k1, v1)
--     return iterate_groups(acc, k1, v1)
-- end)
ui.icons = vim.iter(icons):fold(vim.defaulttable(), function(acc, k1, v1)
    return iterate_groups(acc, k1, v1)
end)

return ui
