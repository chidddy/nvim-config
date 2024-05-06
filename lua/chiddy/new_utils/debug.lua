local debug = {
    _profiler = require('chiddy.external.profile'),
    _p = require('jit.p'),
    _startup = {
        flame = os.getenv('NVIM_FLAME') and true or false,
        profile = os.getenv('NVIM_PROFILE') and true or false,
    },
    flame = {},
    profile = {},
}

function debug.flame.start()
    debug._p.start('F,p,30,i1,s,m0,G', 'profile.log')
end

function debug.flame.stop()
    debug._p.stop()
end

function debug.profile.start()
    debug._profiler.instrument_autocmds()
    debug._profiler.start('*')
end

function debug.profile.stop()
    if debug._profiler.is_recording() then
        debug._profiler.stop()
        debug._profiler.export('profile.json')
    end
end

function debug.startup(stop)
    if debug._startup.flame then
        debug.flame.start()
        vim.api.nvim_create_autocmd(stop, { callback = debug.flame.stop })
    end
    if debug._startup.profile then
        debug.profile.start()
        vim.api.nvim_create_autocmd(stop, { callback = debug.profile.stop })
    end
end

return debug
