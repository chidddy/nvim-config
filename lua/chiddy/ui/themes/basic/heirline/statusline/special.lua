local conditions = require('heirline.conditions')
-- local comp = require('chiddy.ui.components.heirline')
local config = require('chiddy.core.config')
return {
    condition = function()
        return conditions.buffer_matches({
            buftype = config.bt.disable_visuals,
            filetype = config.ft.disable_visuals,
        })
    end,
    -- comp.filetype,
    -- comp.space,
    -- comp.help,
    -- comp.align,
}
