local utils = require('chiddy.utils.status')
local icons = require('chiddy.utils.icons')
local vimode = {
    provider = function(self)
        return utils.mode_name(self.mode) .. ' ' .. icons.misc.Ball
    end,
    hl = function(self)
        -- local mode = self.mode:sub(1, 1)
        return { fg = 'text_dark', bg = utils.mode_color(self.mode), bold = true }
    end,
}

return { mode = vimode }
