---@class LazyPlugin
local M = {
    'folke/neodev.nvim',
    ft = 'lua',
}

function M.config()
    require('neodev').setup({
        debug = true,
        setup_jsonls = true,
        library = {
            enabled = true,
            runtime = true,
            types = true,
            plugins = true,
        },
        lspconfig = true,
        pathStrict = true,
    })
end

-- function M.config()
--     require('neodev').setup({
--         setup_jsonls = true,
--         library = {
--             enabled = true,
--             runtime = true,
--             types = true,
--             plugins = true,
--         },
--         lspconfig = true,
--         experimental = {
--             pathStrict = true,
--         },
--     })
-- end

return M
