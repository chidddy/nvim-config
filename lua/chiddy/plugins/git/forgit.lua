---@class LazyPlugin
local M = {
    'ray-x/forgit.nvim',
    dependencies = {
        'ray-x/guihua.lua',
    },
    cmd = {
        'Git',
    },
    enabled = false,
}

function M.config()
    require('forgit').setup({
        ls_file = 'fd', -- git ls-file
        fugitive = false,
        git_alias = true,
        diff = 'delta', -- diff-so-fancy
        exact = false, -- Exact match
        vsplit = true, -- split forgit window the screen vertically
        show_result = 'quickfix', -- show cmd result in quickfix or notify
        height_ratio = 0.6, -- height ratio of forgit window when split horizontally
        width_ratio = 0.6, -- height ratio of forgit window when split vertically
    })
end

return M
