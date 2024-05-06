local cfg = require('chiddy.core.config')
local obsidian_dir = string.format('%s/%s', cfg.home, cfg.obsidian)
---@class LazyPlugin
local plugin = {
    'epwalsh/obsidian.nvim',
    -- event = { string.format('BufReadPre %s/%s', cfg.home, cfg.obsidian) },
    event = { 'BufReadPre ' .. obsidian_dir .. '/**.md' },
    enabled = false,
}

function plugin.config()
    require('obsidian').setup({
        -- config
        dir = obsidian_dir, -- no need to call 'vim.fn.expand' here
    })
end

return plugin
