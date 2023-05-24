-- local conditions = require('heirline.conditions')
local icons = require('chiddy.utils.icons')

local termname = {
    provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub('.*:', '')
        return icons.misc.Terminal .. tname
    end,
    hl = { fg = 'blue', bold = true },
}

local helpname = {
    condition = function()
        return vim.bo.filetype == 'help'
    end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ':t')
    end,
    hl = { fg = 'blue' },
}

local indent = {
    provider = function()
        return vim.opt.tabstop:get()
    end,
}

local showcmd = {
    condition = function()
        return require('noice').api.status.command.has()
    end,
    provider = function()
        return require('noice').api.status.command.get()
    end,
    hl = { fg = 'blue' },
}

return {
    help = helpname,
    term = termname,
    indent = indent,
    align = { provider = '%=' },
    space = { provider = ' ' },
    null = { provider = '' },
    showcmd = showcmd,
}
