---@class LazyPlugin
local plugin = {
    'sindrets/diffview.nvim',
    cmd = {
        'DiffviewOpen',
        'DiffviewClose',
        'DiffviewToggleFiles',
    },
}

function plugin.config()
    require('diffview').setup({
        -- config
        view = {
            merge_tool = {
                layout = 'diff3_mixed',
            },
        },
    })
end

return plugin
