local fn = vim.fn
local files = {}
function files.ft()
    return vim.api.nvim_buf_get_option(0, 'filetype')
end

function files.dir(dir)
    local res = fn.isdirectory(dir)
    if res == 0 then
        fn.mkdir(dir, 'p')
    end
end

function files.executable(name)
    if fn.executable(name) > 0 then
        return true
    end
    return false
end

function files.get_relative()
    local fname = fn.expand('%:p')
    return fname:gsub(fn.getcwd() .. '/', '')
end

function files.get_path(name)
    name = fn.fnamemodify()
    return vim.loop.fs_realpath(name) or name
end

function files.get_relative_git()
    local fname = fn.expand('%:t')
    local gitpath = fn.systemlist('git rev-parse --show-toplevel')[1]
    return fname:gsub(gitpath, '') .. '/' .. fname
end

function files.exists(path)
    local stat = vim.loop.fs_stat(path)
    return (stat and stat.type) or false
end

return files
