local colors = require('catppuccin.palettes').get_palette('mocha')
local ucolors = require('chiddy.utils.colors')

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

function utils.create_colors()
    return {
        base = colors.crust,
        -- first = colors.base,
        -- first = '#2a2a41',
        -- first = ucolors.brighten(colors.base, 0.07),
        first = ucolors.brighten(colors.base, 0.14),
        -- second = colors.base,
        -- second = '#1a1a28',
        second = ucolors.brighten(colors.base, 0.07),
        -- second = '#1c1c2b',
        third = ucolors.brighten(colors.base, 0.01),
        -- third = '#151520',
        text = colors.text,
        text_dark = colors.surface0,
        none = 'NONE',
        highlight = colors.teal,
        red = colors.red,
        green = colors.green,
        blue = colors.blue,
        gray = colors.overlay0,
        orange = colors.peach,
        purple = colors.mauve,
        cyan = colors.sky,
        diag_warn = colors.yellow,
        diag_error = colors.red,
        diag_hint = colors.teal,
        diag_info = colors.sky,
        git_del = colors.red,
        git_add = colors.green,
        git_change = colors.yellow,
    }
end

return utils
