local conditions = require('heirline.conditions')
local comp = require('chiddy.themes.status.components')

local statusline = {
    condition = conditions.is_not_active,
    comp.filetype,
    comp.space,
    comp.filename,
    comp.align,
}

return statusline
