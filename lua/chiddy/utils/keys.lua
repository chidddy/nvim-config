local keys = {}

function keys.keymap(mode, lhs, rhs, opts)
    local finalRhs = ''
    local callback = nil
    if type(rhs) == 'string' then
        finalRhs = rhs
    else
        callback = rhs
    end

    opts = vim.tbl_deep_extend('keep', opts or {}, {
        noremap = true,
        silent = true,
        expr = false,
        callback = callback,
    })

    vim.api.nvim_set_keymap(mode, lhs, finalRhs, opts)
end

function keys.buf_keymap(mode, lhs, rhs, opts, buf)
    local finalRhs = ''
    local callback = nil
    if type(rhs) == 'string' then
        finalRhs = rhs
    else
        callback = rhs
    end

    opts = vim.tbl_deep_extend('keep', opts or {}, {
        noremap = true,
        silent = true,
        expr = false,
        callback = callback,
    })

    vim.api.nvim_buf_set_keymap(buf, mode, lhs, finalRhs, opts)
end
return keys
