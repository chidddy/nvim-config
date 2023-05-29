local dap = require('dap')
local dap_config = require('chiddy.core.config').dap
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
