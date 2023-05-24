local conditions = require('heirline.conditions')
local comp = require('chiddy.themes.status.components')

local statusline = {
    condition = function()
        return conditions.buffer_matches({ buftype = { 'terminal' } })
    end,
    { condition = conditions.is_active, comp.mode, comp.space },
    comp.filetype,
    comp.space,
    comp.term,
    comp.align,
}

return statusline
