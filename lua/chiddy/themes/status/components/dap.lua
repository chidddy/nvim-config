local icons = require('chiddy.utils.icons')
local dap = {
    condition = function()
        local session = require('dap').session()
        return session ~= nil
    end,
    provider = function()
        return icons.ui.Bug .. ' ' .. require('dap').status()
    end,
    hl = 'Debug',
}

return { dap = dap }
