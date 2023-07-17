local conditions = require('heirline.conditions')
local icons = require('chiddy.utils.icons')
local utils = require('heirline.utils')

---@type StatusLine
local git = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,
}

---@type StatusLine
local has_changes = {
    hl = function(self)
        -- local ret = { fg = 'blue' }
        return (self.has_changes and { fg = 'highlight', bold = true, force = true }) or { fg = 'blue' }
    end,
}

---@type StatusLine
local branch = {
    provider = function(self)
        return icons.git.Branch .. ' ' .. self.status_dict.head
    end,
}
---@type StatusLine
local changes = {
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and (icons.git.Add .. count .. ' ')
        end,
        hl = { fg = 'git_add' },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (icons.git.Remove .. count .. ' ')
        end,
        hl = { fg = 'git_del' },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and (icons.git.Mod .. count .. ' ')
        end,
        hl = { fg = 'git_change' },
    },
}

return { branch = utils.insert(git, branch), changes = utils.insert(git, changes), has_changes = has_changes }
