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
