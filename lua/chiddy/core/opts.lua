local icons = require('chiddy.utils.icons')
local indent = 4

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.markdown_recommended_style = 0

vim.g.clipboard = {
    name = 'xsel',
    copy = {
        ['+'] = 'xsel --nodetach -ib',
        ['*'] = 'xsel --nodetach -ib',
    },
    paste = {
        ['+'] = 'xsel -ob',
        ['*'] = 'xsel -ob',
    },
    cache_enabled = 1,
}

vim.opt.autowrite = true
vim.o.clipboard = 'unnamedplus,unnamed'
vim.opt.shada = "!,'10,<50,s10,h,/100,:10"
vim.opt.shadafile = vim.fn.stdpath('state') .. '/shada/main.shada'
vim.opt.conceallevel = 3
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.cindent = false
vim.opt.autoindent = true
vim.opt.confirm = true
vim.opt.completeopt = {
    'menu',
    'menuone',
    'noselect',
}
vim.opt.mouse = 'a' -- to visually select and copy from vim without line numbers
vim.opt.lazyredraw = false -- dont redraw whileexecuting macros (performance)
vim.opt.ttyfast = true -- dont redraw while executing macros (performance)
vim.opt.hlsearch = false -- keep search cunks highlighted
vim.opt.ignorecase = true -- search case-sensitive
vim.opt.smartcase = true -- if pattern contains capital it becomes case sensitive
vim.opt.smartindent = true -- smarter indentation
vim.opt.smarttab = true -- make tab smartter
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'
vim.opt.startofline = false
vim.opt.showcmd = true -- show what commands you are typing, what you select in visual mode, etc
vim.opt.showmode = false
vim.opt.showmatch = false -- highlight  matching [{()}]
vim.opt.autowrite = true -- automatically :write before running commands
vim.opt.scrolloff = 8 -- how many lines til window border to see when scrolling
vim.opt.smoothscroll = true
vim.opt.sidescroll = 2
vim.opt.sidescrolloff = 15 -- same as above but for columns
vim.opt.inccommand = 'nosplit' -- incremental search (enabled by default)
vim.opt.joinspaces = false -- no double spaces with join after a dot
vim.opt.updatetime = 50 -- timeout for showing cursorhold events, etc
vim.o.shortmess = 'aTFIWcC' -- better messages
vim.opt.hidden = true -- Textedit might fail if hidden is not set
vim.opt.termguicolors = true -- use terminal gui colors
-- guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20',
vim.opt.background = 'dark'
vim.opt.encoding = 'UTF-8'
vim.opt.list = true
vim.opt.splitbelow = true -- split below instead of above
vim.opt.splitright = true -- split right instead of left
-- omnifunc = 'v:lua.vim.lsp.omnifunc',
vim.opt.signcolumn = 'yes' -- nothing to the left of line number
vim.opt.foldlevel = 99 -- deepest fold is 10 levels
vim.opt.foldlevelstart = 99 -- deepest fold is 10 levels
vim.opt.foldenable = true --dont enable folding by default
vim.opt.foldcolumn = '1' --dont enable folding by default
vim.opt.wrap = false -- dont wrap text
vim.opt.linebreak = true -- do not break words, only 'by words'
vim.opt.number = true -- show line umber
vim.opt.numberwidth = 1 -- by default 4, and because of that there is empty space to the right of line umbers except current
vim.opt.relativenumber = true --show relative line number for the current line
-- cursorcolumn = true, --gihlight the current column
vim.opt.colorcolumn = '' -- "80,120", -- highlight some column length
vim.opt.wildignorecase = true
vim.opt.spell = false
vim.opt.cursorline = true -- highlight the screen line of the cursor with Cursorline
vim.opt.modeline = false
vim.opt.previewheight = 12
vim.opt.pumheight = 10
vim.opt.shiftround = true
vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.expandtab = true -- expand tabs into spaces
vim.opt.redrawtime = 1500
vim.opt.timeoutlen = 300 -- faster timeout wait time,
vim.opt.ttimeoutlen = 0
-- vim.o.formatoptions = 'jcroqlnt'
vim.opt.formatoptions = {
    t = false, -- wrap text using textwidth
    c = true, -- wrap comments using textwidth
    r = true, -- insert comment leader after hitting <enter> in insert mode
    o = true, -- insert comment leader after hitting 'o' or 'O' in normal mode
    q = true, -- allow formatting comments with 'gq'
    n = true, -- recognize numbered lists
    ['1'] = true, -- dont break a line after a one letter word
    ['2'] = true, -- use indent of the second line of a paragraph for the rest of the paragraph instead of the first
    l = true, -- long lines arent broken in insert mode
    j = true, -- remove a comment leader when joining lines
}
vim.opt.shell = 'zsh'
vim.opt.syntax = 'off'
vim.opt.fillchars = {
    eob = ' ',
    foldopen = icons.ui.ArrowOpen,
    foldclose = icons.ui.ArrowClosed,
    foldsep = ' ',
    fold = ' ',
}
vim.opt.listchars = {
    trail = icons.ui.Circle,
    tab = icons.ui.DoubleSeparator .. ' ',
    extends = icons.ui.BracketRight,
    precedes = icons.ui.BracketLeft,
    nbsp = '_',
    space = ' ',
}
vim.opt.sessionoptions = {
    'buffers',
    'curdir',
    'tabpages',
    'winsize',
}
vim.opt.splitkeep = 'screen'

vim.opt.wildignore = {
    '*.aux',
    '*.out',
    '*.toc',
    '*.o',
    '*.obj',
    '*.dll',
    '*.jar',
    '*.pyc',
    '*.aux',
    '*.class',
    '*.gif',
    '*.ico',
    '*.jpg',
    '*.jpeg',
    '*.png',
    '*.avi',
    '*.wav',
    '*.webm',
    '*.mp4',
    '*.eot',
    '*.otf',
    '*.ttf',
    '*.woff',
    '*.mp3',
    '*.zip',
    '*.tar.gz',
    '*.tar.bz2',
    '*.rar',
    '*.tar.xz',
    '.sass-cache',
    '*/vendor/gems/*',
    '*/vendor/cache/*',
    '*/.bundle/*',
    '*.gem',
    '*.*~',
    '*~ ',
    '*.swp',
    '.lock',
    '.DS_Store',
    '._*',
    'tags.lock',
}

-- vim.g.startuptime_more_info_key_seq = 'K'
-- vim.g.startuptime_tries = 10
-- vim.g.startuptime_sort = 0
-- vim.g.startuptime_fine_blocks = 1

-- vim.opt.wildignore = {
--     '.lock',
--     '.sass-cache',
--     '.git',
--     '.hg',
--     '.svn',
--     '*.pyc',
--     '*.o',
--     '*.out',
--     '**/tmp/**',
--     '.DS_Store',
--     '**/node_modules/**',
--     '**/bower_modules/**',
-- }
-- vim.opt.matchpairs = {
--     '(:)',
--     '{:}',
--     '[:]',
--     '<:>',
-- }

-- vim.cmd('syntax on')
