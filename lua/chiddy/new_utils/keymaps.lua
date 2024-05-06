--[[
ideas:

loaded = {
    keys = {},
    trees = {},
    roles = {},
}

-- NEW IDEAS
local tree_code = KeyTree("c", "code")
tree_code:key("a", func, "code action")

local tree_lsp = KeyTree('l', 'lsp')
tree_lsp:key('i', func, 'info')

tree_code:subtree(tree_lsp)


groups contain keys and trees and roles
trees all have names and trees with the same name merge
roles act like hydra (will just export to hydra tbh)

essentials for keybind class format
- mode
- key
- exec
- opts

TODO:
decoupled keymap declaration from plugins
but allow plugins to load keymaps as they please

TODO:
keys and keymaps when loaded can be loaded with bufnr

TODO:
need method to integrate with plugins:
- [ ] which-key
- [ ] hydra
- [ ] legendary?

TODO:
need to export to string/tbl so that readme script can parse

TODO:
subroles for hydra?

--]]

---@alias MappingModeList
---| '"n"'
---| '"i"'
---| '"v"'
---| '"s"'
---| '"c"'
---| '"x"'

---@alias MappingModeArray MappingModeList[]

---@alias MappingMode MappingModeList|MappingModeArray

---@class MappingOptions
---@field noremap boolean
---@field silent boolean
---@field nowait boolean
---@field expr boolean
---@field buffer integer
---@field desc string

---@class KeyDict<T>: { [string]: T }
---@class ModeDict<T>: { [MappingMode]: T }

---@class KeyDef
---@field [1] string|fun() exec
---@field [2] MappingOptions options

---@class TreeDef
---@field name string
---@field [string] (KeyDef|TreeDef)[]

---@class ModeDef
---@field name string
---@field [string] KeyDef[]

---@class GroupDef
---@field keys? ModeDict<KeyDict<KeyDef>>
---@field trees? KeyDict<TreeDef>
---@field roles? ModeDict<KeyDict<ModeDef>>

---@class Key
---@field mode MappingMode
---@field key string
---@field exec string|fun()
---@field opts MappingOptions

---@class Tree
---@field name string
---@field prefix string
---@field keys Key[]
---@field subtrees { [string]: Tree }

---@class Role
---@field name string
---@field mode MappingMode
---@field prefix string
---@field keys Key[]

---@class Group
---@field keys Key[]
---@field trees Tree[]
---@field roles Role[]

---@class Groups
---@field private groups Group[]
local groups = {
    groups = {},
}

---@class Keys
---@field private keys Key[]
local keys = {
    keys = {},
}

---@class Trees
---@field private trees Tree[]
local trees = {
    trees = {},
}

---@class roles
---@field private roles Role[]
local roles = {
    roles = {},
}

---@class keymaps
---@field groups Groups
---@field keys Keys
---@field roles Roles
local keymaps = {
    groups = groups,
    keys = keys,
    trees = trees,
    roles = roles,
    loaded = {
        keys = {},
        trees = {},
        roles = {},
    },
}

---@param opts table dump options
---@return table
function keymaps.dump(opts)
    local ret = {}
    return ret
end

---@return table
function keymaps.wk()
    local ret = {}
    return ret
end

---@return table
function keymaps.hydra()
    local ret = {}
    return ret
end

---@return table
function keymaps.legendary()
    local ret = {}
    return ret
end

--- GROUPS IMPL

local function mode_key_iter(iter, func)
    local ret = {}
    local counter = 1
    vim.iter(iter):fold({}, function(_, mode, keys)
        vim.iter(keys):fold({}, function(_, key, def)
            ret[counter] = func(mode, key, def)
            counter = counter + 1
        end)
    end)
    return ret
end

---@param name string group name
---@param group GroupDef
function groups.new(name, group)
    ---@type Group
    local ret = {}
    if group.keys then
        ret.keys = mode_key_iter(group.keys, keymaps.keys.new)
    end

    if group.trees then
        vim.iter(group.trees):fold({}, function(_, key, def)
            ret.trees[def.name] = keymaps.trees.new(key, def)
        end)
    end

    if group.roles then
        ret.roles = mode_key_iter(group.modes, keymaps.modes.new)
    end
    keymaps.groups.groups[name] = ret
end

--- KEYS IMPL

---@param mode MappingMode
---@param key string
---@param def KeyDef
---@return Key
function keys.new(mode, key, def)
    ---@type Key
    return {
        mode = mode,
        key = key,
        exec = def[1],
        opts = def[2],
    }
end

--- TREES IMPL

---@param prefix string
---@param def TreeDef
---@return Tree
function trees.new(prefix, def)
    ---@type Tree
    local ret = {}
    ret.prefix = prefix
    local counter = 1
    vim.iter(def):fold({}, function(_, key, val)
        if key == 'name' then
            ret.name = val
        else
            if val.name then
                -- TODO:
                -- subtree
                ret.subtrees[val.name] = keymaps.trees.new(key, val)
            else
                -- key
                ret.keys[counter] = keymaps.keys.new('n', key, val)
                counter = counter + 1
            end
        end
    end)
    return ret
end

--- roles IMPL

---@param mode MappingMode
---@param prefix string
---@param def ModeDef
---@return Mode
function roles.new(mode, prefix, def)
    ---@type Mode
    local ret = {}

    ret.mode = mode
    ret.prefix = prefix
    local counter = 1
    vim.iter(def):fold({}, function(_, key, val)
        if key == 'name' then
            ret.name = val
        else
            -- key
            ret.keys[counter] = keymaps.keys.new(mode, key, val)
            counter = counter + 1
        end
    end)

    return ret
end

return keymaps
