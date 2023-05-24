local ui = {}

function ui.warn(msg, name)
    vim.notify(msg, vim.log.levels.WARN, { title = name or 'init.lua' })
end

function ui.error(msg, name)
    vim.notify(msg, vim.log.levels.ERROR, { title = name or 'init.lua' })
end

function ui.info(msg, name)
    vim.notify(msg, vim.log.levels.INFO, { title = name or 'init.lua' })
end

function ui.float(fn, opts)
    local buf = vim.api.nvim_create_buf(false, true)
    local vpad = 4
    local hpad = 10
    opts = vim.tbl_deep_extend('force', {
        relative = 'editor',
        width = vim.o.columns - hpad * 2,
        height = vim.o.lines - vpad * 2,
        row = vpad,
        col = hpad,
        style = 'minimal',
        border = 'rounded',
    }, opts or {})
    local win = vim.api.nvim_open_win(buf, true, opts)

    local function close()
        if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
        vim.cmd([[checktime]])
    end

    vim.keymap.set('n', '<ESC>', close, { buffer = buf, nowait = true })
    vim.keymap.set('n', 'q', close, { buffer = buf, nowait = true })
    require('chiddy.utils.opt').aucmd({ 'BufDelete, BufLeave, BufHidden' }, close, { once = true, buffer = buf })
    fn(buf, win)
end

function ui.float_cmd(cmd, opts)
    ui.float(function(buf)
        local output = vim.api.nvim_exec(cmd, true)
        local lines = vim.split(output, '\n')
        vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)
    end, opts)
end

function ui.float_terminal(cmd, opts)
    ui.float(function(buf, win)
        vim.fn.termopen(cmd)
        local autocmd = {
            'autocmd! TermClode <buffer> lua vim.cmd[[checktime]];',
            string.format('vim.api.nvim_win_close(%d, {force = true})l;', win),
            string.format('vim.api.nvim_buf_delete(%d, {force = true})l;', buf),
        }
        vim.cmd(table.concat(autocmd, ' '))
        vim.cmd([[startinsert]])
    end, opts)
end

return ui
