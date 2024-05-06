local uv = vim.uv

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
vim.opt.runtimepath:prepend(lazypath)

local Util = require('lazy.core.util')

---@class LazySpecLoader
---@field plugins table<string, LazyPlugin>
---@field disabled table<string, LazyPlugin>
---@field modules string[]
---@field notifs {msg:string, level:number, file?:string}[]
---@field importing? string
---@field optional? boolean
local Spec = {}

---@param spec? LazySpec
---@param opts? {optional?:boolean}
function Spec.new(spec, opts)
    local self = setmetatable({}, { __index = Spec })
    self.plugins = {}
    self.disabled = {}
    self.modules = {}
    self.notifs = {}
    self.optional = opts and opts.optional
    if spec then
        self:parse(spec)
    end
    return self
end

function Spec:parse(spec)
    self:normalize(spec)
end

-- PERF: optimized code to get package name without using lua patterns
function Spec.get_name(pkg)
    local name = pkg:sub(-4) == '.git' and pkg:sub(1, -5) or pkg
    name = name:sub(-1) == '/' and name:sub(1, -2) or name
    local slash = name:reverse():find('/', 1, true) --[[@as number?]]
    return slash and name:sub(#name - slash + 2) or pkg:gsub('%W+', '_')
end

---@param plugin LazyPlugin
---@param results? string[]
---@param is_dep? boolean
function Spec:add(plugin, results, is_dep)
    -- check if we already processed this spec. Can happen when a user uses the same instance of a spec in multiple specs
    -- see https://github.com/folke/lazy.nvim/issues/45
    if rawget(plugin, '_') then
        if results then
            table.insert(results, plugin.name)
        end
        return plugin
    end

    local is_ref = plugin[1] and not plugin[1]:find('/', 1, true)

    if not plugin.url and not is_ref and plugin[1] then
        local prefix = plugin[1]:sub(1, 4)
        if prefix == 'http' or prefix == 'git@' then
            plugin.url = plugin[1]
        else
            plugin.url = string.format('https://github.com/%s.git', plugin[1])
        end
    end

    if plugin.dir then
        plugin.dir = Util.norm(plugin.dir)
        -- local plugin
        plugin.name = plugin.name or Spec.get_name(plugin.dir)
    elseif plugin.url then
        plugin.name = plugin.name or Spec.get_name(plugin.url)
    elseif is_ref then
        plugin.name = plugin[1]
    else
        self:error('Invalid plugin spec ' .. vim.inspect(plugin))
        return
    end

    if not plugin.name or plugin.name == '' then
        self:error('Plugin spec ' .. vim.inspect(plugin) .. ' has no name')
        return
    end

    if type(plugin.config) == 'table' then
        self:warn(
            '{'
                .. plugin.name
                .. '}: setting a table to `Plugin.config` is deprecated. Please use `Plugin.opts` instead'
        )
        ---@diagnostic disable-next-line: assign-type-mismatch
        plugin.opts = plugin.config
        plugin.config = nil
    end

    plugin._ = {}
    plugin._.dep = is_dep

    plugin.dependencies = plugin.dependencies and self:normalize(plugin.dependencies, {}, true) or nil
    if self.plugins[plugin.name] then
        plugin = self:merge(self.plugins[plugin.name], plugin)
    end
    self.plugins[plugin.name] = plugin
    -- vim.print(plugin)
    if results then
        table.insert(results, plugin.name)
    end
    return plugin
end

function Spec:error(msg)
    self:log(msg, vim.log.levels.ERROR)
end

function Spec:warn(msg)
    self:log(msg, vim.log.levels.WARN)
end

---@param gathered_deps string[]
---@param dep_of table<string,string[]>
---@param on_disable fun(string):nil
function Spec:fix_dependencies(gathered_deps, dep_of, on_disable)
    local function should_disable(dep_name)
        for _, parent in ipairs(dep_of[dep_name] or {}) do
            if self.plugins[parent] then
                return false
            end
        end
        return true
    end

    for _, dep_name in ipairs(gathered_deps) do
        -- only check if the plugin is still enabled and it is a dep
        if self.plugins[dep_name] and self.plugins[dep_name]._.dep then
            -- check if the dep is still used by another plugin
            if should_disable(dep_name) then
                -- disable the dep when no longer needed
                on_disable(dep_name)
            end
        end
    end
end

function Spec:fix_cond()
    for _, plugin in pairs(self.plugins) do
        local cond = plugin.cond
        if cond == false or (type(cond) == 'function' and not cond(plugin)) then
            plugin._.cond = false
            plugin.enabled = false
        end
    end
end

---@return string[]
function Spec:fix_optional()
    local all_optional_deps = {}
    if not self.optional then
        ---@param plugin LazyPlugin
        local function all_optional(plugin)
            return (not plugin) or (rawget(plugin, 'optional') and all_optional(plugin._.super))
        end

        -- handle optional plugins
        for _, plugin in pairs(self.plugins) do
            if plugin.optional and all_optional(plugin) then
                self.plugins[plugin.name] = nil
                if plugin.dependencies then
                    vim.list_extend(all_optional_deps, plugin.dependencies)
                end
            end
        end
    end
    return all_optional_deps
end

function Spec:fix_disabled()
    for _, plugin in pairs(self.plugins) do
        if not plugin.name or not plugin.dir then
            self:error(
                'Plugin spec for **' .. plugin.name .. '** not found.\n```lua\n' .. vim.inspect(plugin) .. '\n```'
            )
            self.plugins[plugin.name] = nil
        end
    end

    ---@type table<string,string[]> plugin to parent plugin
    local dep_of = {}

    ---@type string[] dependencies of disabled plugins
    local disabled_deps = {}

    ---@type string[] dependencies of plugins that are completely optional
    local all_optional_deps = self:fix_optional()
    self:fix_cond()

    for _, plugin in pairs(self.plugins) do
        local enabled = not (plugin.enabled == false or (type(plugin.enabled) == 'function' and not plugin.enabled()))
        if enabled then
            for _, dep in ipairs(plugin.dependencies or {}) do
                dep_of[dep] = dep_of[dep] or {}
                table.insert(dep_of[dep], plugin.name)
            end
        else
            plugin._.kind = 'disabled'
            self.plugins[plugin.name] = nil
            self.disabled[plugin.name] = plugin
            if plugin.dependencies then
                vim.list_extend(disabled_deps, plugin.dependencies)
            end
        end
    end

    -- fix deps of plugins that are completely optional
    self:fix_dependencies(all_optional_deps, dep_of, function(dep_name)
        self.plugins[dep_name] = nil
    end)
    -- fix deps of disabled plugins
    self:fix_dependencies(disabled_deps, dep_of, function(dep_name)
        local plugin = self.plugins[dep_name]
        plugin._.kind = 'disabled'
        self.plugins[plugin.name] = nil
        self.disabled[plugin.name] = plugin
    end)
end

---@param msg string
---@param level number
function Spec:log(msg, level)
    self.notifs[#self.notifs + 1] = { msg = msg, level = level, file = self.importing }
end

function Spec:report(level)
    level = level or vim.log.levels.ERROR
    for _, notif in ipairs(self.notifs) do
        if notif.level >= level then
            Util.notify(notif.msg, { level = notif.level })
        end
    end
end

---@param spec LazySpec|LazySpecImport
---@param results? string[]
---@param is_dep? boolean
function Spec:normalize(spec, results, is_dep)
    if type(spec) == 'string' then
        if is_dep and not spec:find('/', 1, true) then
            -- spec is a plugin name
            if results then
                table.insert(results, spec)
            end
        else
            self:add({ spec }, results, is_dep)
        end
    elseif #spec > 1 or Util.is_list(spec) then
        ---@cast spec LazySpec[]
        for _, s in ipairs(spec) do
            self:normalize(s, results, is_dep)
        end
    elseif spec[1] or spec.dir or spec.url then
        ---@cast spec LazyPlugin
        local plugin = self:add(spec, results, is_dep)
        ---@diagnostic disable-next-line: cast-type-mismatch
        ---@cast plugin LazySpecImport
        if plugin and plugin.import then
            self:import(plugin)
        end
    elseif spec.import then
        ---@cast spec LazySpecImport
        self:import(spec)
    else
        self:error('Invalid plugin spec ' .. vim.inspect(spec))
    end
    return results
end

---@param spec LazySpecImport
function Spec:import(spec)
    if spec.import == 'lazy' then
        return self:error("You can't name your plugins module `lazy`.")
    end
    if type(spec.import) ~= 'string' then
        return self:error('Invalid import spec. `import` should be a string: ' .. vim.inspect(spec))
    end
    if vim.tbl_contains(self.modules, spec.import) then
        return
    end
    if spec.enabled == false or (type(spec.enabled) == 'function' and not spec.enabled()) then
        return
    end

    self.modules[#self.modules + 1] = spec.import

    local imported = 0

    ---@type string[]
    local modnames = {}
    Util.lsmod(spec.import, function(modname)
        modnames[#modnames + 1] = modname
    end)
    table.sort(modnames)

    for _, modname in ipairs(modnames) do
        imported = imported + 1
        Util.track({ import = modname })
        self.importing = modname
        -- unload the module so we get a clean slate
        ---@diagnostic disable-next-line: no-unknown
        package.loaded[modname] = nil
        Util.try(function()
            local mod = require(modname)
            if type(mod) ~= 'table' then
                self.importing = nil
                return self:error(
                    'Invalid spec module: `'
                        .. modname
                        .. '`\nExpected a `table` of specs, but a `'
                        .. type(mod)
                        .. '` was returned instead'
                )
            end
            self:normalize(mod)
            self.importing = nil
            Util.track()
        end, {
            msg = 'Failed to load `' .. modname .. '`',
            on_error = function(msg)
                self:error(msg)
                self.importing = nil
                Util.track()
            end,
        })
    end
    if imported == 0 then
        self:error('No specs found for module ' .. spec.import)
    end
end

---@param old LazyPlugin
---@param new LazyPlugin
---@return LazyPlugin
function Spec:merge(old, new)
    new._.dep = old._.dep and new._.dep

    if new.url and old.url and new.url ~= old.url then
        self:error('Two plugins with the same name and different url:\n' .. vim.inspect({ old = old, new = new }))
    end

    if new.dependencies and old.dependencies then
        Util.extend(new.dependencies, old.dependencies)
    end

    new._.super = old
    setmetatable(new, { __index = old })

    return new
end

local pl = { import = 'chiddy.plugins' }

---@type string[]
local modnames = {}
Util.lsmod(pl.import, function(modname)
    modnames[#modnames + 1] = modname
end)
table.sort(modnames)
local iter = vim.iter(modnames)

local plugins = {}

iter:each(function(modname)
    local mod_name = string.match(modname, 'chiddy%.plugins%.(.-)$')
    plugins[mod_name] = Spec.new({ import = modname })
end)

-- [contributors-shield]: https://img.shields.io/github/contributors/chidddy/nvim-config.svg?style=for-the-badge
local plugins_string = ''
local format =
    '* [%s](%s) ![](https://img.shields.io/github/stars/%s.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/%s.svg?style=for-the-badge)\n'
for module, spec in vim.spairs(plugins) do
    local header = string.format('### %s plugins\n\n', module)
    local pl_text = ''

    for plugin_name, plugin_spec in vim.spairs(spec.plugins) do
        local plugin_index = string.format(
            format,
            plugin_name,
            string.gsub(plugin_spec.url, '%.git$', ''),
            plugin_spec[1],
            plugin_spec[1]
        )
        pl_text = pl_text .. plugin_index
    end

    if pl_text == '' then
        pl_text = '* **none**\n'
    end

    plugins_string = plugins_string .. header .. pl_text .. '\n'
end

local function readFileSync(path)
    local fd = assert(uv.fs_open(path, 'r', 438))
    local stat = assert(uv.fs_fstat(fd))
    local data = assert(uv.fs_read(fd, stat.size, 0))
    assert(uv.fs_close(fd))
    return data
end

local templ = readFileSync('TEMPLATE.md')

plugins_string = string.gsub(plugins_string, '\n\n$', '\n')

local readme = string.gsub(templ, '<!%-%- SCRIPT_PLUGINS %-%->\n', plugins_string)

local lsps = require('chiddy.core.config').lsp.servers
local lsp_string = ''

for location, list in vim.spairs(lsps) do
    if location == 'installer' then
        lsp_string = lsp_string .. '### installed by mason: \n\n'
    else
        lsp_string = lsp_string .. '\n### installed manually: \n\n'
    end

    vim.iter(list):each(function(item)
        lsp_string = lsp_string .. '* ' .. item .. '\n'
    end)
end

readme = string.gsub(readme, '<!%-%- SCRIPT_LANGUAGESERVERS %-%->\n', lsp_string)

local function writeFile(path, data)
    local fd = assert(uv.fs_open(path, 'w+', 438))
    uv.fs_write(fd, data)
    assert(uv.fs_close(fd))
end

if arg[1] then
    writeFile(arg[1], readme)
else
    print(readme)
end
