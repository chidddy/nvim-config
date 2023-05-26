local opt = {}

function opt.aucmd(event, action, opts, filetype)
    -- local _event = event
    -- local _filetype = filetype
    opts = opts or {}
    if type(event) ~= 'string' then
        event = table.concat(event, ',')
    end

    if filetype ~= nil and filetype.pattern == nil then
        filetype = { pattern = filetype }
    end
    vim.api.nvim_create_autocmd(event, vim.tbl_deep_extend('force', opts, { callback = action }, filetype or {}))
end

function opt.augroup(name, clear)
    return vim.api.nvim_create_augroup(name, clear and { clear = true } or {})
end

function opt.usrcmd(name, func, opts)
    vim.api.nvim_create_user_command(name, func, opts or {})
end

function opt.cabbrev(input, replace)
    local cmd = 'cnoreabbrev %s %s'
    vim.cmd(cmd:format(input, replace))
end

local function keyval_option(value)
    local ret = {}
    local val = value.val or value
    if type(val) == 'string' then
        for k, v in string.gmatch(val, '(%w+):([^,]+)') do
            ret[k] = v
        end
    else
        if vim.tbl_islist(val) and value.val ~= nil then
            for z = 1, #val do
                local k, v = string.match(val[z], '(%w+):(.+)')
                ret[k] = v
            end
        else
            ret = val
        end
    end
    -- dump(ret)
    return ret
end

local function flag_option(value)
    local ret = {}
    local val = value.val or value
    if type(val) == 'string' then
        for v in val:gmatch('.') do
            ret[v] = true
        end
    else
        ret = val
    end
    return ret
end

function opt.apply_option(name, value)
    local info = vim.opt[name]._info
    if info.commalist then
        local method = value._method or 'set'
        local val = keyval_option(value)
        if method ~= 'set' then
            vim.opt[name][method](vim.opt[name], val)
        else
            vim.opt[name] = val
        end
    elseif info.flaglist then
        local method = value._method or 'set'
        local val = flag_option(value)
        if method ~= 'set' then
            vim.opt[name][method](vim.opt[name], val)
        else
            vim.opt[name] = val
        end
    else
        vim.opt[name] = value
    end
end

return opt
