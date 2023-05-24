local vim = vim
local fn = vim.fn
local api = {}

function api.isNonEmptyString(str)
    if str == nil then
        return false
    end
    if str == '' then
        return false
    end
    return true
end

function api.split(str, sep)
    local res = {}
    for w in str:gmatch('([^' .. sep .. ']*)') do
        if w ~= '' then
            res[#res + 1] = w
        end
    end
    return res
end

function api.sleep(sec)
    vim.cmd('sleep ' .. sec)
end

function api.require(mod)
    return api.try(require, mod)
end

function api.try(_fn, ...)
    local args = { ... }

    return xpcall(function()
        return _fn(unpack(args))
    end, function(err)
        local lines = {}
        table.insert(lines, err)
        table.insert(lines, debug.traceback('', 3))
        require('chiddy.utils.ui').error(table.concat(lines, '\n'))
        return err
    end)
end

function api.debug_pcall()
    _G.pcall = function(_fn, ...)
        local args = { ... }
        return xpcall(_fn and function()
            return _fn(unpack(args))
        end, function(err)
            if err:find('DevIcon') or err:find('mason') or err:find('Invalid highlight') then
                return err
            end
            vim.api.nvim_echo({ { err, 'ErrorMsg' }, { debug.traceback('', 3), 'Normal' } }, true, {})
        end)
    end
end

function api.t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function api.has(feat)
    if fn.has(feat) == 1 then
        return true
    end
    return false
end

function api.version()
    local actual_version = vim.version()
    return string.format('%d.%d.%d', actual_version.major, actual_version.minor, actual_version.patch)
end
function api.rand_int(low, high)
    math.randomseed(os.time())
    return math.random(low, high)
end

function api.rand_el(seq)
    return seq[api.rand_int(1, #seq)]
end

function api.get_active_lsp_client_names()
    local active_clients = vim.lsp.get_active_clients()
    local client_names = {}
    for k = 1, #active_clients do
        local buf = vim.api.nvim_get_current_buf()
        local client = active_clients[k]
        if vim.lsp.buf_is_attached(buf, client.id) then
            client_names[#client_names + 1] = client.name
        end
    end
    if not vim.tbl_isempty(client_names) then
        table.sort(client_names)
    end
    return client_names
end

function api.debounce(ms, _fn)
    local timer = vim.loop.new_timer()
    return function(...)
        local argv = { ... }
        timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(_fn)(unpack(argv))
        end)
    end
end

function api.toggle(option, silent)
    local info = vim.api.nvim_get_option_info(option)
    local scopes = { buf = 'bo', win = 'wo', global = 'o' }
    local scope = scopes[info.scope]
    local options = vim.scope
    options[option] = not options[option]
    if silent ~= true then
        if options[option] then
            require('chiddy.utils.ui').warn('enabled vim.' .. scope .. '.' .. option, 'Toggle')
        else
            require('chiddy.utils.ui').warn('disabled vim.' .. scope .. '.' .. option, 'Toggle')
        end
    end
end

return api
