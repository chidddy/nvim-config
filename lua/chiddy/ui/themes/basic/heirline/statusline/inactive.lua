local conditions = require('heirline.conditions')
local comp = require('chiddy.ui.components.heirline')

return {
    condition = conditions.is_not_active,
    comp.filetype,
    comp.space,
    comp.filename,
    comp.align,
}
