local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
    root = vim.fn.stdpath('data') .. '/lazy', -- directory where plugins will be installed
    spec = {
        { import = 'chiddy.plugins' },
    },
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
        version = nil,
        -- version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json', -- lockfile generated after running update.
    git = {
        -- defaults for the `Lazy log` command
        log = {
            '--since=1 days ago',
            '--no-merges',
            '--perl-regexp',
            '--author=^((?!git).*)$',
            '--invert-grep',
            '--grep=chore:',
        }, -- show the last 10 commits
        -- log = { '--since=3 days ago' }, -- show commits from the last 3 days
        timeout = 120, -- kill processes that take more than 2 minutes
        url_format = 'https://github.com/%s.git',
    },
    dev = {
        -- directory where you store your local plugin projects
        path = '~/projects/lua/nvim',
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { 'catppuccin', 'habamax' },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = 'rounded',
        icons = {
            cmd = ' ',
            config = '',
            event = '',
            ft = ' ',
            init = ' ',
            keys = ' ',
            plugin = ' ',
            runtime = ' ',
            source = ' ',
            start = '',
            task = '✔ ',
        },
        throttle = 20, -- how frequently should the ui process render events
    },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get b notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
            path = vim.fn.stdpath('state') .. '/lazy/cache',
            -- Once one of the following events triggers, caching will be disabled.
            -- To cache all modules, set this to `{}`, but that is not recommended.
            -- The default is to disable on:
            --  * VimEnter: not useful to cache anything else beyond startup
            --  * BufReadPre: this will be triggered early when opening a file from the command line directly
            disable_events = { 'VimEnter', 'BufReadPre' },
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[] list any dirs you want to add to rtp
            paths = {},
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                '2html_plugin',
                'fzf',
                'getscript',
                'getscriptPlugin',
                'gzip',
                'logiPat',
                'matchit',
                'matchparen',
                'netrw',
                'netrwFileHandlers',
                'netrwPlugin',
                'netrwSettings',
                'node_provider',
                'python3_provider',
                'rrhelper',
                'ruby_provider',
                'spellfile_plugin',
                'tar',
                'tarPlugin',
                'tohtml',
                'tutor',
                'vimball',
                'vimballPlugin',
                'zip',
                'zipPlugin',
            },
        },
    },
})
