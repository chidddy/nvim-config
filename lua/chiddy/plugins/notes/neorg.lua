---@class LazyPlugin
local M = {
    'nvim-neorg/neorg',
    event = 'BufEnter *.norg',
    build = ':Neorg sync-parsers',
}
function M.config()
    require('neorg').setup({
        load = {
            ['core.defaults'] = {},
            ['core.dirman'] = {
                config = {
                    workspaces = {
                        work = '~/notes/work',
                        home = '~/notes/home',
                    },
                },
            },
            ['core.concealer'] = {},
            ['core.completion'] = {
                config = {
                    engine = 'nvim-cmp',
                },
            },
            ['core.integrations.nvim-cmp'] = {},
        },
    })
end

return M
