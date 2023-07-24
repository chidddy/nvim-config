local comp = require('chiddy.ui.components.heirline')
local conditions = require('heirline.conditions')
local sutils = require('chiddy.utils.status')
local utils = require('heirline.utils')
local icons = require('chiddy.utils.icons')

local function create_section(side, children)
    return {
        init = function(self)
            self.section_order = self.add_section(side)
        end,
        hl = function(self)
            return { bg = self:section_color(side) }
        end,
        {
            {
                condition = function(self)
                    return self.section_order - 1 >= 1
                end,
                provider = function()
                    if side == 'left' then
                        return icons.sep.SlantRight_alt
                    elseif side == 'right' then
                        return icons.sep.SlantRight
                    else
                        return ''
                    end
                end,
                hl = function(self)
                    return { fg = self:section_color(side, self.section_order - 1) }
                end,
            },
            children,
        },
    }
end

local function create_end(side)
    return {
        hl = function(self)
            local hi = side == 'right' and self.sections[side] + 1 or self.sections[side]
            return { bg = 'base', fg = self:section_color(side, hi) }
        end,
        provider = function()
            if side == 'left' then
                return icons.sep.SlantRight_alt
            elseif side == 'right' then
                return icons.sep.SlantLeft_alt
            else
                return ''
            end
        end,
    }
end

local left = {
    create_section('left', {
        comp.space,
        comp.mode,
    }),
    create_section('left', {
        comp.space,
        comp.folder,
        comp.space,
        {
            provider = icons.misc.Slash,
            hl = { fg = 'blue', bold = true, force = true },
        },
        comp.space,
        comp.filename,
    }),
    {
        condition = conditions.is_git_repo,
        create_section('left', {
            comp.space,
            utils.insert(utils.insert(comp.has_changes, comp.cwd, comp.space, comp.branch), comp.space),
            comp.changes,
        }),
    },
    {
        condition = conditions.has_diagnostics,
        create_section('left', {
            comp.space,
            comp.diag,
        }),
    },
    create_end('left'),
}
local mid = {
    fallthrough = false,
    -- comp.search,
    comp.navic,
}
local right = {
    create_end('right'),
    create_section('right', {
        comp.space,
        comp.fileicon,
        comp.filetype,
        comp.space,
    }),
    {
        condition = conditions.lsp_attached,
        create_section('right', {
            comp.space,
            comp.lsp,
            comp.space,
        }),
    },
    {
        hl = { fg = 'blue' },
        create_section('right', {
            comp.space,
            comp.position,
            comp.space,
        }),
    },
    {
        hl = { fg = 'text_dark' },
        create_section('right', {
            comp.space,
            {
                provider = icons.ui.Document .. ' ',
            },
            comp.percent,
            comp.space,
        }),
    },
}
return {
    condition = conditions.is_active,
    init = function(self)
        self.sections = { left = 0, right = 0 }
        self.add_section = function(side)
            self.sections[side] = self.sections[side] + 1
            return self.sections[side]
        end
    end,
    static = {
        color_order = {
            left = {
                function()
                    return sutils.mode_color(vim.api.nvim_get_mode().mode)
                end,
                'layer3',
                'layer2',
                'layer1',
            },
            right = {
                'layer1',
                'layer2',
                'layer3',
                function()
                    return sutils.mode_color(vim.api.nvim_get_mode().mode)
                end,
            },
        },
        section_color = function(self, side, override)
            local idx = override or self.section_order or nil
            side = side or 'left'
            local ret = 'base'
            if idx then
                local color = self.color_order[side][idx]
                if color then
                    if type(color) == 'function' then
                        ret = color()
                    else
                        ret = color
                    end
                end
            end
            return ret
        end,
    },
    { left, comp.align, mid, comp.align, right },
}
