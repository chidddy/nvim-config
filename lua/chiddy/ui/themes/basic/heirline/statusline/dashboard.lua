local conditions = require('heirline.conditions')
local list = require('chiddy.core.config').ft.dashboard
return {
    condition = function()
        return conditions.buffer_matches({
            buftype = list,
            filetype = list,
        })
    end,
}
