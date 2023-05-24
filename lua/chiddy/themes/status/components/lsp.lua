local conditions = require('heirline.conditions')
local icons = require('chiddy.utils.icons')
-- local utils = require('heirline.utils')
local Navic = require('nvim-navic')
local lspactive = {
    condition = conditions.lsp_attached,
    update = { 'LspAttach', 'LspDetach' },
    provider = function()
        return icons.ui.Gear .. ' ' .. require('chiddy.utils.api').get_active_lsp_client_names()[1]
    end,
    hl = { fg = 'blue', bold = true },
}

local navic = {
    condition = function()
        Navic.is_available()
    end,
    provider = function()
        return Navic.get_location()
    end,
    update = 'CursorMoved',
}

local diag = {
    condition = conditions.has_diagnostics,
    static = {
        error_icon = icons.diagnostics.Error .. ' ',
        warn_icon = icons.diagnostics.Warning .. ' ',
        info_icon = icons.diagnostics.Information .. ' ',
        hint_icon = icons.diagnostics.Hint .. ' ',
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    update = { 'DiagnosticChanged', 'BufEnter' },
    {
        provider = function(self)
            return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
        end,
        hl = { fg = 'diag_error' },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
        end,
        hl = { fg = 'diag_warn' },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. ' ')
        end,
        hl = { fg = 'diag_info' },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints .. ' ')
        end,
        hl = { fg = 'diag_hint' },
    },
}

return {
    diag = diag,
    -- navic = utils.make_flexible_component(3, navic, { provider = '' }),
    navic = navic,
    lsp = lspactive,
}
