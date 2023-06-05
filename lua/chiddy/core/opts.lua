local icons = require('chiddy.utils.icons')
local indent = 4
local g = vim.g
local opt = vim.opt
local o = vim.o

g.mapleader = ' '
g.maplocalleader = ' '

g.markdown_recommended_style = 0

g.clipboard = {
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

-- opt.autowrite = true
o.clipboard = 'unnamedplus,unnamed'
-- opt.shada = "!,'10,<50,s10,h,/100,:10"
-- opt.shadafile = vim.fn.stdpath('state') .. '/shada/main.shada'
opt.conceallevel = 3
opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
opt.grepformat = '%f:%l:%c:%m'
opt.laststatus = 2
opt.cmdheight = 1
-- opt.wildmenu = true
opt.wildmode = 'longest:full,full'
opt.cindent = false
opt.autoindent = true
opt.confirm = true
opt.completeopt = {
    'menu',
    'menuone',
    'noselect',
}
opt.mouse = 'a' -- to visually select and copy from vim without line numbers
opt.lazyredraw = false -- dont redraw whileexecuting macros (performance)
opt.ttyfast = true -- dont redraw while executing macros (performance)
opt.hlsearch = false -- keep search cunks highlighted
opt.ignorecase = true -- search case-sensitive
opt.smartcase = true -- if pattern contains capital it becomes case sensitive
opt.smartindent = true -- smarter indentation
opt.smarttab = true -- make tab smartter
opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.writebackup = false
opt.backup = false
-- opt.backupdir = vim.fn.stdpath('state') .. '/backup'
opt.startofline = false
opt.showcmd = true -- show what commands you are typing, what you select in visual mode, etc
opt.showmode = false
opt.showmatch = false -- highlight  matching [{()}]
-- opt.autowrite = true -- automatically :write before running commands
opt.scrolloff = 8 -- how many lines til window border to see when scrolling
opt.smoothscroll = true
opt.sidescroll = 2
opt.sidescrolloff = 15 -- same as above but for columns
opt.inccommand = 'nosplit' -- incremental search (enabled by default)
opt.joinspaces = false -- no double spaces with join after a dot
opt.updatetime = 50 -- timeout for showing cursorhold events, etc
o.shortmess = 'aTFIWcC' -- better messages
opt.hidden = true -- Textedit might fail if hidden is not set
opt.termguicolors = true -- use terminal gui colors
-- guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20',
opt.background = 'dark'
opt.encoding = 'UTF-8'
opt.list = true
opt.splitbelow = true -- split below instead of above
opt.splitright = true -- split right instead of left
-- omnifunc = 'v:lua.vim.lsp.omnifunc',
opt.signcolumn = 'yes' -- nothing to the left of line number
opt.foldlevel = 99 -- deepest fold is 10 levels
opt.foldlevelstart = 99 -- deepest fold is 10 levels
opt.foldenable = true --dont enable folding by default
opt.foldcolumn = '1' --dont enable folding by default
opt.wrap = false -- dont wrap text
opt.linebreak = true -- do not break words, only 'by words'
opt.number = true -- show line umber
opt.numberwidth = 1 -- by default 4, and because of that there is empty space to the right of line umbers except current
opt.relativenumber = true --show relative line number for the current line
-- cursorcolumn = true, --gihlight the current column
opt.colorcolumn = '' -- "80,120", -- highlight some column length
opt.wildignorecase = true
opt.spell = false
opt.cursorline = true -- highlight the screen line of the cursor with Cursorline
opt.modeline = false
opt.previewheight = 12
opt.pumheight = 10
opt.shiftround = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.expandtab = true -- expand tabs into spaces
opt.redrawtime = 1500
opt.timeoutlen = 300 -- faster timeout wait time,
opt.ttimeoutlen = 0
-- o.formatoptions = 'jcroqlnt'
opt.formatoptions = {
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
opt.shell = 'zsh'
opt.syntax = 'off'
opt.fillchars = {
    eob = ' ',
    foldopen = icons.ui.ArrowOpen,
    foldclose = icons.ui.ArrowClosed,
    foldsep = ' ',
    fold = ' ',
}
opt.listchars = {
    trail = icons.ui.Circle,
    tab = icons.ui.DoubleSeparator .. ' ',
    extends = icons.ui.BracketRight,
    precedes = icons.ui.BracketLeft,
    nbsp = '_',
    space = ' ',
}
opt.sessionoptions = {
    'buffers',
    'curdir',
    'tabpages',
    'winsize',
}
opt.splitkeep = 'screen'

opt.wildignore = {
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

-- g.startuptime_more_info_key_seq = 'K'
-- g.startuptime_tries = 10
-- g.startuptime_sort = 0
-- g.startuptime_fine_blocks = 1

-- opt.wildignore = {
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
-- opt.matchpairs = {
--     '(:)',
--     '{:}',
--     '[:]',
--     '<:>',
-- }

-- vim.cmd('syntax on')
