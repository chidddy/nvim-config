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
    main = '',
    secondary = '',
}

local color_provider = {}

local function check_load()
    if colors.red == '' then
        color_provider.set(require('chiddy.plugins.themes.' .. require('chiddy.core.config').palette).colors())
    end
end

function color_provider.get()
    check_load()
    return colors
end

function color_provider.clone()
    return vim.deepcopy(colors)
end

function color_provider.clone_flat()
    check_load()
    local ret = {}
    local function _flatten(t)
        for key, val in pairs(t) do
            if type(val) == 'table' then
                _flatten(val)
            elseif val then
                ret[key] = val
            end
        end
    end
    _flatten(colors)
    return ret
end

function color_provider.set(new_colors)
    colors = new_colors
end

return color_provider
