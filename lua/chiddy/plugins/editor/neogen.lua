---@class LazyPlugin
local plugin = {
    'danymat/neogen',
}

function plugin.config()
    require('neogen').setup({
        snippet_engine = 'luasnip',
    })
end

return plugin
