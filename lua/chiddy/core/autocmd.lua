-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'VeryLazy',
--     callback = function()
--         require('chiddy.core.keymaps')
--     end,
-- })

-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'VeryLazy',
--     callback = function()
--         local cutils = require('chiddy.utils.colors')
--         local colors = require('chiddy.ui.colors').get()
--         vim.api.nvim_set_hl(0, 'murmur_cursor_rgb', {
--             bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
--         })
--         vim.api.nvim_set_hl(0, 'murmur_cursor_rgb_current', {
--             bg = cutils.modify(colors.main, { l = 52, c = 8.3 }),
--         })
--         vim.api.nvim_set_hl(0, 'LspInlayHint', {
--             bold = true,
--             fg = cutils.modify(colors.main, { l = 86, c = 6.5 }),
--         })
--         vim.api.nvim_set_hl(0, 'TreeSitterContext', { fg = '#cdd6f4' })
--     end,
-- })

vim.api.nvim_create_autocmd('FileType', {
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
    pattern = require('chiddy.core.config').ft.quick_close,
})
-- Disable statusline in dashboard
vim.api.nvim_create_autocmd('User', {
    pattern = 'AlphaReady',
    callback = function()
        -- store current statusline value and use that
        local old_tabline = vim.opt_local.showtabline
        local old_ruler = vim.opt_local.ruler
        vim.api.nvim_create_autocmd('BufUnload', {
            buffer = 0,
            callback = function()
                vim.cmd.syntax('on')
                vim.opt_local.guicursor:remove('a:Cursor2/lCursor2')
                vim.opt_local.ruler = old_ruler
                vim.opt_local.showtabline = old_tabline
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

vim.api.nvim_create_augroup('neogit-additions', {})
vim.api.nvim_create_autocmd('FileType', {
    group = 'neogit-additions',
    pattern = 'NeogitCommitMessage',
    command = 'silent! set filetype=gitcommit',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'gitconfig',
    callback = function()
        vim.opt_local.commentstring = '# %s'
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'gitcommit', 'markdown', 'NeogitCommitMessage' },
    callback = function()
        vim.opt_local.conceallevel = 0
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- vim.api.nvim_create_autocmd('VimEnter', {
--     callback = function()
--         local should_skip = false
--         if vim.fn.argc() > 0 or vim.fn.line2byte(vim.fn.line('$')) ~= -1 or not vim.o.modifiable then
--             should_skip = true
--         else
--             for _, arg in pairs(vim.v.argv) do
--                 if arg == '-b' or arg == '-c' or vim.startswith(arg, '+') or arg == '-S' then
--                     should_skip = true
--                     break
--                 end
--             end
--         end
--         if not should_skip then
--             local theme = string.format('chiddy.ui.themes.%s.alpha', require('chiddy.core.config').theme)
--             require('alpha').start(true, require(theme).config)
--             vim.schedule(function()
--                 vim.cmd.doautocmd('FileType')
--             end)
--         end
--     end,
-- })


-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- local function sync_save(client, bufnr)
--     if client.supports_method('textDocument/formatting') then
--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--         vim.api.nvim_create_autocmd('BufWritePre', {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--                 if require('chiddy.core.config').lsp.format_on_save == true then
--                     -- vim.lsp.buf.format({
--                     --     async = false,
--                     --     bufnr = bufnr,
--                     --     filter = function(format_client)
--                     --         return format_client.name == 'null-ls'
--                     --     end,
--                     -- })
--                 end
--             end,
--         })
--     end
-- end

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 100 })
    end,
})
