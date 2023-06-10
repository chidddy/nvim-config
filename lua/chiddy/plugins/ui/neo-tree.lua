---@class LazyPlugin
local M = {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'NeoTree',
    branch = 'main',
    event = 'VeryLazy',
    enabled = false,
}

function M.config()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    local icons = require('chiddy.utils.icons')

    require('neo-tree').setup({
        sources = {
            'filesystem',
            'buffers',
            'git_status',
        },
        close_if_last_window = false,
        close_floats_on_escape_key = true,
        default_source = 'filesystem',
        enable_git_status = true,
        enable_diagnostics = true,
        enable_modified_markers = true,
        enable_refresh_on_write = true,
        sort_case_insensitive = true,
        use_default_mappings = false,
        popup_border_style = 'rounded',
        use_popups_for_input = true,
        hide_root_node = false,
        default_component_configs = {
            container = {
                enable_charcter_fade = false,
                width = '100%',
                right_padding = 0,
            },
            diagnostics = {
                symbols = {
                    hint = icons.diagnostics.Hint_alt,
                    info = icons.diagnostics.Information_alt,
                    warn = icons.diagnostics.Warning_alt,
                    error = icons.diagnostics.Error_alt,
                },
                highlights = {
                    error = 'DiagnosticError',
                    warn = 'DiagnosticWarn',
                    info = 'DiagnosticInfo',
                    hint = 'DiagnosticHint',
                },
            },
            indent = {
                indent_size = 2,
                padding = 1,
                with_markers = false,
            },
            icon = {
                folder_closed = icons.ui.Folder,
                folder_open = icons.ui.FolderOpen,
                folder_empty = icons.ui.EmptyFolderOpen,
            },
            modified = {
                symbol = icons.ui.Pencil .. ' ',
                highlight = 'NeoTreeModified',
            },
            name = {
                use_git_status_colors = false,
            },
            git_status = {
                symbols = {
                    added = icons.git.Add,
                    deleted = icons.git.Remove,
                    modified = icons.git.Mod,
                    renamed = icons.ui.Pencil,
                    untracked = icons.ui.File,
                    ignored = icons.git.Ignore,
                    unstaged = icons.ui.BigUnfilledCircle,
                    staged = icons.ui.BigCircle,
                    conflict = icons.git.Diff,
                },
                align = 'right',
            },
        },
        renderers = {
            directory = {
                { 'indent' },
                { 'icon' },
                { 'current_filter' },
                {
                    'container',
                    content = {
                        { 'name', zindex = 10 },
                        { 'clipboard', zindex = 10 },
                        { 'diagnostics', errors_only = true, zindex = 20, align = 'right', hide_when_expanded = true },
                        { 'git_status', zindex = 20, align = 'right', hide_when_expanded = true },
                    },
                },
            },
            file = {
                { 'indent' },
                { 'icon' },
                {
                    'container',
                    content = {
                        { 'name', zindex = 10 },
                        { 'clipboard', zindex = 10 },
                        { 'bufnr', zindex = 10 },
                        { 'modified', zindex = 20, align = 'right' },
                        { 'diagnostics', zindex = 20, align = 'right' },
                        { 'git_status', zindex = 20, align = 'right' },
                    },
                },
            },
            message = {
                { 'indent', with_markers = false },
                { 'name', highlight = 'NeoTreeMessage' },
            },
            terminal = {
                { 'indent' },
                { 'icon' },
                { 'name' },
                { 'bufnr' },
            },
        },
        window = {
            position = 'left',
            width = 50,
            insert_as = 'sibling',
            -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
            -- You can also create your own commands by providing a function instead of a string.
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ['<tab>'] = {
                    'toggle_node',
                    nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
                },
                ['<2-LeftMouse>'] = 'open',
                ['<cr>'] = 'open',
                ['<esc>'] = 'revert_preview',
                ['P'] = { 'toggle_preview', config = { use_float = true } },
                ['S'] = 'open_split',
                -- ["S"] = "split_with_window_picker",
                ['s'] = 'open_vsplit',
                -- ["s"] = "vsplit_with_window_picker",
                ['t'] = 'open_tabnew',
                -- ["<cr>"] = "open_drop",
                -- ["t"] = "open_tab_drop",
                ['w'] = 'open_with_window_picker',
                ['C'] = 'close_node',
                ['z'] = 'close_all_nodes',
                --["Z"] = "expand_all_nodes",
                ['R'] = 'refresh',
                ['a'] = {
                    'add',
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = 'none', -- "none", "relative", "absolute"
                    },
                },
                ['A'] = 'add_directory', -- also accepts the config.show_path option.
                ['d'] = 'delete',
                ['r'] = 'rename',
                ['y'] = 'copy_to_clipboard',
                ['x'] = 'cut_to_clipboard',
                ['p'] = 'paste_from_clipboard',
                ['c'] = 'copy', -- takes text input for destination, also accepts the config.show_path option
                ['m'] = 'move', -- takes text input for destination, also accepts the config.show_path option
                ['e'] = 'toggle_auto_expand_width',
                ['q'] = 'close_window',
                ['?'] = 'show_help',
                ['<'] = 'prev_source',
                ['>'] = 'next_source',
            },
        },
        event_handlers = {
            {
                event = 'file_opened',
                handler = function()
                    require('neo-tree').close_all()
                end,
            },
            {
                event = 'after_render',
                handler = function()
                    if
                        (vim.bo.filetype == 'neo-tree' or vim.bo.filetype == 'neo-tree-popup')
                        or vim.api.nvim_buf_get_var(0, 'neo_tree_position') == 'current'
                    then
                        return
                    end
                    local state = require('neo-tree.sources.manager').get_state('filesystem')
                    if not require('neo-tree.sources.common.preview').is_active() then
                        state.config = { use_float = false }
                        state.commands.toggle_preview(state)
                    end
                end,
            },
        },
        filesystem = {
            bind_to_cwd = true,
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_hidden = true,
                hide_by_name = {
                    'node_modules',
                },
                never_show = {
                    '.DS_Store',
                    'thumbs.db',
                },
            },
            follow_current_file = true,
            group_empty_dirs = true,
            hijack_netrw_behavior = 'open_current',
            use_libuv_file_watcher = false,
            async_directory_scan = 'auto',
            window = {
                mappings = {
                    ['H'] = 'toggle_hidden',
                    ['/'] = 'fuzzy_finder',
                    ['D'] = 'fuzzy_finder_directory',
                    --["/"] = "filter_as_you_type", -- this was the default until v1.28
                    ['f'] = 'filter_on_submit',
                    ['<C-x>'] = 'clear_filter',
                    ['<bs>'] = 'navigate_up',
                    ['.'] = 'set_root',
                    ['[g'] = 'prev_git_modified',
                    [']g'] = 'next_git_modified',
                },
            },
        },
        buffers = {
            bind_to_cwd = true,
            follow_current_file = true,
            group_empty_dirs = true,
            show_unloaded = true,
            window = {
                mappings = {
                    ['<bs>'] = 'navigate_up',
                    ['.'] = 'set_root',
                    ['bd'] = 'buffer_delete',
                },
            },
        },
        source_selector = {
            winbar = true,
            sources = { -- table
                {
                    source = 'filesystem', -- string
                    display_name = ' ' .. icons.cmp.path .. ' files ',
                },
                {
                    source = 'buffers', -- string
                    display_name = ' ' .. icons.cmp.buffer .. ' buffers ',
                },
                {
                    source = 'git_status', -- string
                    display_name = ' ' .. icons.git.Git .. ' git ',
                },
            },
            content_layout = 'center',
            tabs_layout = 'equal',
            truncation_character = icons.ui.Truncate,
            separator = icons.sep.VerticalBar,
            show_separator_on_edge = false,
            highlight_tab = 'NeoTreeTabInactive',
            highlight_tab_active = 'NeoTreeTabActive',
            highlight_background = 'NeoTreeTabInactive',
            highlight_separator = 'NeoTreeTabSeparatorInactive',
            highlight_separator_active = 'NeoTreeTabSeparatorActive',
        },
        bind_to_cwd = true,
        cwd_target = {
            sidebar = 'tab',
            current = 'window',
        },
    })
end

return M
