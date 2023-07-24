local conditions = require('heirline.conditions')
local comp = require('chiddy.ui.components.heirline')

return {
    condition = function()
        return conditions.buffer_matches({ buftype = { 'terminal' } })
    end,
    { condition = conditions.is_active, comp.mode, comp.space },
    comp.filetype,
    comp.space,
    comp.term,
    comp.align,
}
