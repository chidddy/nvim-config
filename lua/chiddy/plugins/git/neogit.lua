---@class LazyPlugin
local M = {
    'NeogitOrg/neogit',
}

function M.config()
    local icons = require('chiddy.utils.icons')
    require('neogit').setup({
        disable_hint = false,
        disable_context_highlighting = false,
        disable_signs = false,
        disable_commit_confirmation = false,
        disable_builtin_notifications = false,
        disable_insert_on_commit = true,
        use_magit_keybindings = false,
        auto_refresh = true,
        kind = 'tab',
        -- The time after which an output console is shown for slow running commands
        console_timeout = 2000,
        status = {
            recent_commit_count = 10,
        },
        commit_popup = {
            kind = 'split',
        },
        popup = {
            kind = 'split',
        },
        signs = {
            hunk = { '', '' },
            item = { icons.ui.ArrowClosed, icons.ui.ArrowOpen },
            section = { icons.ui.ArrowClosed, icons.ui.ArrowOpen },
        },
        integrations = {
            diffview = false,
        },
        sections = {
            untracked = {
                folded = false,
            },
            unstaged = {
                folded = false,
            },
            staged = {
                folded = false,
            },
            stashes = {
                folded = true,
            },
            unpulled = {
                folded = true,
            },
            unmerged = {
                folded = false,
            },
            recent = {
                folded = true,
            },
            rebase = {
                folded = true,
            },
        },
        mappings = {
            status = {
                ['q'] = 'Close',
                ['1'] = 'Depth1',
                ['2'] = 'Depth2',
                ['3'] = 'Depth3',
                ['4'] = 'Depth4',
                ['<tab>'] = 'Toggle',
                ['x'] = 'Discard',
                ['s'] = 'Stage',
                ['S'] = 'StageUnstaged',
                ['<c-s>'] = 'StageAll',
                ['u'] = 'Unstage',
                ['U'] = 'UnstageStaged',
                ['d'] = 'DiffAtFile',
                ['$'] = 'CommandHistory',
                ['#'] = 'Console',
                ['<c-r>'] = 'RefreshBuffer',
                ['<enter>'] = 'GoToFile',
                ['<c-v>'] = 'VSplitOpen',
                ['<c-x>'] = 'SplitOpen',
                ['<c-t>'] = 'TabOpen',
                ['?'] = 'HelpPopup',
                ['D'] = 'DiffPopup',
                ['p'] = 'PullPopup',
                ['r'] = 'RebasePopup',
                ['P'] = 'PushPopup',
                ['c'] = 'CommitPopup',
                ['L'] = 'LogPopup',
                ['Z'] = 'StashPopup',
                ['b'] = 'BranchPopup',
            },
        },
    })
end

return M
