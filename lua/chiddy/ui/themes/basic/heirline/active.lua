local comp = require('chiddy.ui.components.heirline')
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local sutils = require('chiddy.utils.status')
local icons = require('chiddy.utils.icons')

local left_segment = {
    {
        init = function(self)
            if not self.once then
                vim.api.nvim_create_autocmd('ModeChanged', { pattern = '*:*o', command = 'redrawstatus' })
                self.once = true
            end
        end,
        hl = function()
            return { fg = sutils.mode_color(vim.api.nvim_get_mode().mode) }
        end,
        utils.surround({ icons.sep.Block, icons.sep.SlantRight_alt }, nil, comp.mode),
    },
    comp.space,
    comp.folder,
    comp.space,
    {
        provider = icons.misc.Slash,
        hl = { fg = 'blue', bold = true, force = true },
    },
    comp.space,
    comp.filename,
}

local get_sep_color = function(bg)
    local ret = { bg = bg }
    if conditions.is_git_repo() then
        ret.fg = 'second'
    else
        ret.fg = 'first'
    end
    return ret
end

local git_segment = {
    utils.insert(utils.insert(comp.has_changes, comp.cwd, comp.space, comp.branch), comp.space),
    comp.changes,
}

local left_extras = {
    {
        condition = conditions.is_git_repo,
        hl = { bg = 'second' },
        utils.clone(comp.slantright_alt, { hl = { fg = 'first' } }),
        comp.space,
        git_segment,
    },
    {
        fallthrough = false,
        {
            condition = conditions.has_diagnostics,
            hl = function()
                return get_sep_color('third')
            end,
            comp.slantright_alt,
            comp.space,
            comp.diag,
            utils.clone(comp.slantright_alt, { hl = { fg = 'third', bg = 'base' } }),
        },
        {
            hl = function()
                return get_sep_color('base')
            end,
            comp.slantright_alt,
        },
    },
}

local mid_segment = {
    fallthrough = false,
    comp.search,
    comp.navic,
}

local right_segment = {
    {
        hl = function()
            return { fg = 'third', bg = 'base' }
        end,
        utils.surround({ icons.sep.SlantLeft_alt, icons.sep.Block }, nil, {
            hl = function()
                return { bg = 'third' }
            end,
            comp.space,
            comp.fileicon,
            comp.filetype,
            comp.space,
        }),
    },
    {
        hl = function()
            return { fg = 'second', bg = 'third' }
        end,
        utils.surround({ icons.sep.SlantLeft_alt, icons.sep.Block }, nil, {
            hl = function()
                return { bg = 'second' }
            end,
            comp.space,
            comp.lsp,
            comp.space,
        }),
    },
    {
        hl = function()
            return { fg = 'first', bg = 'second' }
        end,
        utils.surround({ icons.sep.SlantLeft_alt, '' }, nil, {
            hl = function()
                return { bg = 'first', fg = 'blue' }
            end,
            comp.space,
            comp.position,
            comp.space,
        }),
    },
    {
        init = function(self)
            if not self.once then
                vim.api.nvim_create_autocmd('ModeChanged', { pattern = '*:*o', command = 'redrawstatus' })
                self.once = true
            end
        end,
        hl = function()
            return { fg = sutils.mode_color(vim.api.nvim_get_mode().mode), bg = 'first' }
        end,
        utils.surround({ icons.sep.SlantLeft_alt, icons.sep.Block }, nil, {
            hl = function()
                return { fg = 'text_dark', bg = sutils.mode_color(vim.api.nvim_get_mode().mode) }
            end,
            comp.space,
            {
                provider = icons.ui.Document .. ' ',
            },
            comp.percent,
            comp.space,
        }),
    },
}

local statusline = {
    condition = conditions.is_active,
    {
        hl = { bg = 'first' },
        left_segment,
    },
    left_extras,
    comp.align,
    mid_segment,
    comp.align,
    right_segment,
}

return statusline
