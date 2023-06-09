---@class LazyPlugin
local M = {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
        -- { 'nvim-telescope/telescope-frecency.nvim' },
        -- { 'nvim-telescope/telescope-symbols.nvim' },
        { 'jvgrootveld/telescope-zoxide' },
        { 'benfowler/telescope-luasnip.nvim' },
    },
}

function M.config()
    local icons = require('chiddy.utils.icons')
    local telescope = require('telescope')
    local home = vim.fn.expand('~')
    telescope.setup({
        defaults = {
            initial_mode = 'insert',
            prompt_prefix = ' ' .. icons.ui.Telescope .. ' ',
            selection_caret = icons.ui.ChevronRight .. ' ',
            entry_prefix = ' ',
            path_display = { 'truncate' },
            layout_config = {
                vertical = { width = 0.5 },
            },
        },
        pickers = {
            find_files = {
                find_command = { 'rg', '--hidden', '--files', '--glob', '!.git/*' },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
            file_browser = {
                hidden = true,
                hijack_netrw = false,
                depth = false,
                hide_parent_dir = false,
            },
        },
    })

    -- extensions
    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
    -- telescope.load_extension('notify')
    telescope.load_extension('noice')
    telescope.load_extension('projects')
    -- telescope.load_extension('yank_history')
    telescope.load_extension('zoxide')
    -- telescope.load_extension('find_template')
    -- telescope.load_extension('luasnip')
    -- telescope.load_extension('frecency')
    -- telescope.load_extension('projections')
end

return M
