--[[

base colors:
red
green
blue
yellow
orange
purple
cyan
gray

other colors:
fg
bg
insert-mode
visual-mode
normal-mode
replate-mode
commandline-mode

git colors

diagnostic colors

--]]

--TODO: usage:
-- color_provider.red == colors.red
-- color_provider.red.light == colors.light.red
-- color_provider.red = '' will set colors.red
-- color_provider.red.light = '' will set colors.light.red

local colors = {
    red = '',
    blue = '',
    green = '',
    yellow = '',
    orange = '',
    purple = '',
    cyan = '',
    teal = '',
    gray = '',
    bg = '',
    bg_dark = '',
    text = '',
    text_dark = '',
    modes = {
        normal = '',
        insert = '',
        visual = '',
        delete = '',
        copy = '',
    },
    git = {
        added = '',
        changed = '',
        removed = '',
    },
    diag = {
        error = '',
        warn = '',
        info = '',
        hint = '',
    },
}

local color_provider = {}

function color_provider.get()
    if colors.red == '' then
        color_provider.set(require('chiddy.plugins.themes.' .. require('chiddy.core.config').palette).colors())
    end
    return colors
end
function color_provider.set(new_colors)
    colors = new_colors
end

return color_provider
