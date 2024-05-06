require('chiddy.core.opts')

require('chiddy.core.lazy')

vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        require('chiddy.core.keymaps')
        require('chiddy.core.autocmd')
        local cutils = require('chiddy.utils.colors')
        local colors = require('chiddy.ui.colors').get()
        -- vim.api.nvim_set_hl(0, 'murmur_cursor_rgb', {
        --     bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
        -- })
        -- vim.api.nvim_set_hl(0, 'murmur_cursor_rgb_current', {
        --     bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
        -- })
        vim.api.nvim_set_hl(0, 'LspInlayHint', {
            bold = true,
            fg = cutils.modify(colors.main, { l = 86, c = 6.5 }),
        })
        vim.api.nvim_set_hl(0, 'TreeSitterContext', { fg = '#cdd6f4' })
    end,
})
