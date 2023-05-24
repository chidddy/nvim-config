---@class LazyPlugin
local M = {
    'monaqa/dial.nvim',
}

function M.config()
    local augend = require('dial.augend')

    local words = {
        { 'acquire', 'release' },
        { 'add', 'remove' },
        { 'advance', 'retreat' },
        { 'allocate', 'deallocate' },
        { 'allow', 'deny' },
        { 'assemble', 'disassemble' },
        { 'assign', 'deassign' },
        { 'associate', 'dissociate' },
        { 'attach', 'detach' },
        { 'begin', 'end' },
        { 'bind', 'unbind' },
        { 'bottom', 'middle', 'top' },
        { 'commit', 'rollback' },
        { 'compile', 'decompile' },
        { 'compose', 'parse' },
        { 'compress', 'decompress' },
        { 'connect', 'disconnect' },
        { 'construct', 'destruct' },
        { 'create', 'destroy' },
        { 'do', 'undo' },
        { 'enable', 'disable' },
        { 'encode', 'decode' },
        { 'encrypt', 'decrypt' },
        { 'enqueue', 'dequeue' },
        { 'enter', 'leave' },
        { 'expand', 'collapse' },
        { 'first', 'last' },
        { 'freeze', 'unfreeze' },
        { 'front', 'back' },
        { 'get', 'set' },
        { 'grant', 'revoke' },
        { 'head', 'tail' },
        { 'high', 'low' },
        { 'import', 'export' },
        { 'include', 'exclude' },
        { 'increase', 'decrease' },
        { 'increment', 'decrement' },
        { 'indent', 'dedent' },
        { 'inflate', 'deflate' },
        { 'inject', 'eject' },
        { 'input', 'output' },
        { 'insert', 'delete' },
        { 'install', 'uninstall' },
        { 'left', 'right' },
        { 'Left', 'Right' },
        { 'link', 'unlink' },
        { 'load', 'unload' },
        { 'lock', 'unlock' },
        { 'max', 'min' },
        { 'maximum', 'minimum' },
        { 'new', 'old' },
        { 'next', 'previous' },
        { 'open', 'close' },
        { 'off', 'on' },
        { 'paste', 'cut' },
        { 'push', 'pop' },
        { 'read', 'write' },
        { 'reference', 'dereference' },
        { 'register', 'unregister' },
        { 'resume', 'suspend' },
        { 'select', 'deselect' },
        { 'send', 'receive' },
        { 'serialize', 'deserialize' },
        { 'set', 'get' },
        { 'show', 'hide' },
        { 'start', 'stop' },
        { 'true', 'false' },
        { 'True', 'False' },
        { 'TRUE', 'FALSE' },
        { 'up', 'down' },
        { 'Up', 'Down' },
        { 'upper', 'lower' },
        { 'and', 'or' },
    }

    local symbols = {
        { '&&', '||' },
    }

    local function symbol_constants(sym)
        local ret = {}
        for p = 1, #sym do
            ret[p] = augend.constant.new({
                elements = sym[p],
                word = false,
                cyclic = true,
            })
        end
        return ret
    end
    local function word_constants(wrd)
        local ret = {}
        for p = 1, #wrd do
            ret[p] = augend.constant.new({
                elements = wrd[p],
                word = true,
                cyclic = true,
            })
        end
        return ret
    end

    require('dial.config').augends:register_group({
        default = {
            augend.semver.alias.semver,
            augend.integer.alias.binary,
            augend.integer.alias.decimal_int,
            augend.integer.alias.hex,
            augend.date.alias['%d/%m/%Y'],
            augend.date.alias['%H:%M:%S'],
            augend.constant.alias.bool,
            augend.constant.alias.alpha,
            augend.constant.alias.Alpha,
            unpack(word_constants(words)),
            unpack(symbol_constants(symbols)),
        },
    })
end

return M
