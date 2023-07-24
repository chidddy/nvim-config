local utils = require('chiddy.utils.status')
local icons = require('chiddy.utils.icons')

---@type StatusLine
local vimode = {
    init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
    end,
    provider = function(self)
        return utils.mode_name(self.mode) .. ' ' .. icons.misc.Ball
    end,
    hl = function()
        return { fg = 'text_dark', bold = true }
    end,
    update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
}

return { mode = vimode }
