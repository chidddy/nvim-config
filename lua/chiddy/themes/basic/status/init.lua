local conditions = require('heirline.conditions')
local utils = require('chiddy.utils.status')

local statuslines = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
        self.ext = vim.fn.fnamemodify(self.filename, ':e')
        self.mode = vim.api.nvim_get_mode().mode
    end,
    hl = function()
        if conditions.is_active() then
            return { fg = 'text', bg = 'base' }
        else
            return 'StatusLineNC'
        end
    end,
    fallthrough = false,
    require('chiddy.themes.basic.status.special'),
    require('chiddy.themes.basic.status.terminal'),
    require('chiddy.themes.basic.status.inactive'),
    require('chiddy.themes.basic.status.active'),
}

local M = {}
M.colors = utils.create_colors()
M.statuslines = statuslines
return M
