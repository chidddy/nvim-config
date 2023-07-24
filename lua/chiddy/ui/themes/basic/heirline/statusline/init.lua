local conditions = require('heirline.conditions')
return {
    colors = require('chiddy.utils.status').create_colors(),
    statuslines = {
        hl = function()
            if conditions.is_active() then
                return { fg = 'blue', bg = 'base' }
            else
                return 'StatusLineNC'
            end
        end,
        init = function(self)
            self.filename = vim.api.nvim_buf_get_name(0)
            self.extension = vim.fn.fnamemodify(self.filename, ':e')
        end,
        fallthrough = false,
        require('chiddy.ui.themes.basic.heirline.statusline.dashboard'),
        require('chiddy.ui.themes.basic.heirline.statusline.special'),
        require('chiddy.ui.themes.basic.heirline.statusline.terminal'),
        require('chiddy.ui.themes.basic.heirline.statusline.inactive'),
        require('chiddy.ui.themes.basic.heirline.statusline.active'),
    },
}
