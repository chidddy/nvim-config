local colors = require('chiddy.ui.colors').get()
local cutils = require('chiddy.utils.colors')
local funcs = cutils.funcs

local utils = {}

local mm = {
    n = 'normal',
    p = 'o-pending',
    vl = 'v-line',
    v = 'visual',
    vb = 'visual-block',
    s = 'select',
    sl = 's-line',
    sb = 's-block',
    i = 'insert',
    r = 'replace',
    vr = 'v-replace',
    c = 'command',
    e = 'ex',
    m = 'more',
    sh = 'shell',
    t = 'terminal',
    cf = 'confirm',
    nn = 'none',
}

local ms = {
    n = 'n',
    p = 'op',
    vl = 'vl',
    v = 'v',
    vb = 'vb',
    s = 's',
    sl = 'sl',
    i = 'i',
    r = 'r',
    vr = 'vr',
    c = 'cmd',
    e = 'ex',
    m = 'more',
    sh = 'sh',
    t = 'term',
    cf = 'confirm',
    nn = 'none',
}

local mb = {
    n = 'blue',
    i = 'green',
    c = 'orange',
    v = 'purple',
    r = 'red',
    x = 'gray',
    s = 'red',
}

local mc = {
    n = 'n',
    p = 'n',
    vl = 'v',
    v = 'v',
    vb = 'v',
    s = 's',
    sl = 's',
    i = 'i',
    r = 'r',
    vr = 'r',
    c = 'c',
    e = 'c',
    m = 'c',
    sh = 'c',
    t = 'c',
    cf = 'c',
    nn = 'x',
}

local mode_names = {
    n = 'n',
    no = 'p',
    nov = 'p',
    noV = 'p',
    ['no\22'] = 'p',
    niI = 'n',
    niR = 'n',
    niV = 'n',
    nt = 'n',
    ntT = 'n',
    v = 'v',
    vs = 'v',
    V = 'vl',
    Vs = 'vl',
    ['\22'] = 'vb',
    ['\22s'] = 'vb',
    s = 's',
    S = 'sl',
    ['\19'] = 'sb',
    i = 'i',
    ic = 'i',
    ix = 'i',
    r = 'r',
    rm = 'm',
    ['r?'] = 'cf',
    R = 'r',
    Rc = 'r',
    Rx = 'r',
    Rv = 'vr',
    Rvc = 'vr',
    Rvx = 'vr',
    c = 'c',
    cv = 'e',
    ce = 'e',
    ['!'] = 'sh',
    t = 't',
    ['null'] = 'nn',
}

function utils.mode_name(mode)
    return mm[mode_names[mode]]
end

function utils.mode_name_short(mode)
    return ms[mode_names[mode]]
end

function utils.mode_color(mode)
    return mb[mc[mode_names[mode]]]
end

-- red = clrs.red,
-- blue = clrs.blue,
-- green = clrs.green,
-- yellow = clrs.yellow,
-- orange = clrs.peach,
-- purple = clrs.mauve,
-- cyan = clrs.sky,
-- teal = clrs.teal,
-- gray = clrs.overlay0,
-- bg = clrs.base,
-- text = clrs.text,
-- text_dark = clrs.surface0,
-- modes = {
--     normal = clrs.blue,
--     insert = clrs.green,
--     visual = clrs.purple,
--     delete = clrs.red,
--     copy = clrs.blue,
-- },
-- git = {
--     added = clrs.green,
--     changed = clrs.yellow,
--     removed = clrs.red,
-- },
-- diag = {
--     error = clrs.red,
--     warn = clrs.yellow,
--     info = clrs.sky,
--     hint = clrs.teal,
-- },
function utils.create_colors()
    return {
        base = colors.bg_dark,
        first = cutils.modify(colors.bg, { l = funcs.add(11), c = funcs.add(1.7) }),
        second = cutils.modify(colors.bg, { l = funcs.add(5.3), c = funcs.add(0.8), h = funcs.add(2) }),
        third = cutils.modify(colors.bg, { l = funcs.add(1), c = funcs.minus(0.2), h = funcs.add(0.2) }),
        text = colors.text,
        text_dark = colors.text_dark,
        none = 'NONE',
        highlight = colors.teal,
        red = colors.red,
        green = colors.green,
        blue = colors.blue,
        gray = colors.gray,
        orange = colors.orange,
        purple = colors.purple,
        cyan = colors.cyan,
        diag_warn = colors.yellow,
        diag_error = colors.red,
        diag_hint = colors.teal,
        diag_info = colors.cyan,
        git_del = colors.red,
        git_add = colors.green,
        git_change = colors.yellow,
    }
end

return utils
