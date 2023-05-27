vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        require('chiddy.core.keymaps')
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        local cutils = require('chiddy.utils.colors')
        local colors = require('chiddy.ui.colors')
        local color = cutils.darken(colors.get().blue, 0.7)
        vim.api.nvim_set_hl(0, 'murmur_cursor_rgb', { bg = color })
        vim.api.nvim_set_hl(0, 'TreeSitterContext', { fg = '#cdd6f4' })
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
    pattern = require('chiddy.core.config').quick_exit_ft,
})
-- Disable statusline in dashboard
vim.api.nvim_create_autocmd('User', {
    pattern = 'AlphaReady',
    callback = function()
        -- store current statusline value and use that
        local old_tabline = vim.opt_local.showtabline
        local old_ruler = vim.opt_local.ruler
        local old_laststatus = vim.opt_local.laststatus
        vim.api.nvim_create_autocmd('BufUnload', {
            buffer = 0,
            callback = function()
                vim.opt_local.guicursor:remove('a:Cursor2/lCursor2')
                vim.opt_local.ruler = old_ruler
                vim.opt_local.showtabline = old_tabline
                vim.opt_local.laststatus = old_laststatus
            end,
        })
        local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
        if hl[vim.type_idx] then
            hl[vim.type_idx] = nil
        end
        hl.blend = 100
        hl.nocombine = true
        vim.api.nvim_set_hl(0, 'Cursor2', hl)
        vim.opt_local.guicursor:append('a:Cursor2/lCursor2')
        vim.opt_local.ruler = false
        vim.opt_local.showtabline = 0
        vim.opt_local.laststatus = 0
    end,
})

-- pager mappings for Manual
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'man',
    callback = function()
        vim.keymap.set('n', '<enter>', 'K', { buffer = true })
        vim.keymap.set('n', '<backspace>', '<c-o>', { buffer = true })
    end,
})
vim.api.nvim_create_autocmd('BufWritePost', {
    callback = function()
        if require('chiddy.core.config').lsp.format_on_save == true then
            vim.cmd('FormatWrite')
            -- works just dont want to keep in case they change calling convention
            -- require('formatter.format').format('', nil, 1, -1, { write = true })
        end
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 100 })
    end,
})

vim.api.nvim_create_autocmd({ 'CursorHold' }, {
    pattern = '*',
    callback = function()
        if vim.w.diag_shown then
            return
        end
        if vim.w.cursor_word ~= '' then
            vim.diagnostic.open_float()
            vim.w.diag_shown = true
        end
    end,
})
