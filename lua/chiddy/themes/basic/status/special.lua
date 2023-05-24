local conditions = require('heirline.conditions')
local comp = require('chiddy.themes.status.components')

local statusline = {
    condition = function()
        return conditions.buffer_matches({
            buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
            filetype = { '&git.*', 'fugitive', 'NvimTree', 'packer' },
        })
    end,
    comp.filetype,
    comp.space,
    comp.help,
    comp.align,
}

return statusline
