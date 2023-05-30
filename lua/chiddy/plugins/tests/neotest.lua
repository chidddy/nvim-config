---@class LazyPlugin
local M = {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/neotest-go',
        'nvim-neotest/neotest-plenary',
        'haydenmeade/neotest-jest',
        'rouge8/neotest-rust',
    },
}

function M.config()
    require('neotest').setup({
        consumers = {
            overseer = require('neotest.consumers.overseer'),
        },
        adapters = {
            require('neotest-plenary'),
            require('neotest-go'),
            require('neotest-jest'),
            require('neotest-rust'),
        },
        overseer = {
            enabled = true,
            force_default = false,
        },
    })
end

return M
