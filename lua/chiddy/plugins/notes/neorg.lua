---@class LazyPlugin
local M = {
    'nvim-neorg/neorg',
    event = 'BufEnter *.norg',
}
function M.config()
    require('neorg').setup({
        load = {
            ['core.defaults'] = {},
            ['core.norg.dirman'] = {
                config = {
                    workspaces = {
                        work = '~/notes/work',
                        home = '~/notes/home',
                    },
                },
            },
            ['core.norg.concealer'] = {},
            ['core.norg.completion'] = {
                config = {
                    engine = 'nvim-cmp',
                },
            },
            ['core.integrations.nvim-cmp'] = {},
        },
    })
end

return M
