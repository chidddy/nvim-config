---@alias HeirlineColor string|integer Type: string to hex color code, color alias defined by heirline.load_colors() or fallback to vim standard color name; integer to 24-bit color.
---@alias HeirlineCtermColor string|integer Type: integer to 8-bit color, string to color name alias or default color name.
---@alias HeirlineCtermStyle ("bold"|"underline"|"undercurl"|"underdouble"|"underdotted"|"underdashed"|"strikethrough"|"reverse"|"inverse"|"italic"|"standout"|"altfont"|"nocombine")[]|"NONE"

---@class HeirlineHighlight
---@field fg? HeirlineColor  The foreground color
---@field bg? HeirlineColor  The background color
---@field sp? HeirlineColor  The underline/undercurl color, if any
---@field bold? boolean
---@field italic? boolean
---@field reverse? boolean
---@field inverse? boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field altfont? boolean
---@field nocombine? boolean
---@field ctermfg? HeirlineCtermColor  The foreground color
---@field ctermbg? HeirlineCtermColor  The background color
---@field cterm? HeirlineCtermStyle  The special style for cterm
---@field force? boolean  Control whether the parent's hl fields will override child's hl

---@alias HeirlineOnClickCallback fun(self: StatusLine, minwid: integer, nclicks: integer, button: "l"|"m"|"r", mods: string)
---@class HeirlineOnClick
---@field callback? string|HeirlineOnClickCallback
---@field name? string|fun():string
---@field update? boolean
---@field minwid? number|fun():integer

---@class StatusLine
---@field condition? fun(self: StatusLine): any
---@field init? fun(self: StatusLine): any
---@field provider? string|number|fun(self: StatusLine):string|number|nil
---@field hl? HeirlineHighlight|string|fun(self: StatusLine): HeirlineHighlight|string|nil  controls the colors of what is printed by the component's provider, or by any of its descendants.
---@field restrict? table<string, boolean>
---@field after? fun(self: StatusLine): any
---@field update? table|string|fun(self: StatusLine): boolean
---@field on_click? HeirlineOnClickCallback|HeirlineOnClick
---@field id integer[]
---@field winnr integer
---@field fallthrough boolean
---@field flexible integer
---@field _win_cache? table
---@field _au_id? integer
---@field _tree table
---@field _updatable_components table
---@field _flexible_components table
---@field pick_child? integer[]