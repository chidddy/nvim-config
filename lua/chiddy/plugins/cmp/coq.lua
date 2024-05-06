---@class LazyPlugin
local plugin = {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    enabled = false,
    event = 'InsertEnter',
    build = ':COQdeps',
    dependencies = {
        { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
        { 'ms-jpq/coq.thirdparty', branch = '3p' },
    },
}

function plugin.init()
    vim.g.coq_settings = {
        auto_start = 'shut-up',
        keymap = {
            recommended = false,
        },
        completion = {},
        display = {},
        sources = {},
    }
end

return plugin
