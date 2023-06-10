local dap = require('dap')
local dap_config = require('chiddy.core.config').dap
local icons = require('chiddy.utils.icons')
local ui = require('dapui')

vim.iter(dap_config.adapters):each(function(adapter)
    dap.adapters[adapter] = require('chiddy.dap.adapters.' .. adapter)
end)

vim.iter(dap_config.configs):each(function(config)
    dap.configurations[config] = require('chiddy.dap.configs.' .. config)
end)

dap.listeners.after.event_initialized['dapui_config'] = function()
    ui.open({})
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    ui.close({})
end
dap.listeners.before.event_exited['dapui_config'] = function()
    ui.close({})
end

local sign = vim.fn.sign_define

sign('DapBreakpoint', { text = icons.dap.Breakpoint, texthl = 'DapBreakpoint', linehl = '', numhl = '' })
sign(
    'DapBreakpointCondition',
    { text = icons.dap.BreakpointCondition, texthl = 'DapBreakpointCondition', linehl = '', numhl = '' }
)
sign('DapLogPoint', { text = icons.dap.LogPoint, texthl = 'DapLogPoint', linehl = '', numhl = '' })
