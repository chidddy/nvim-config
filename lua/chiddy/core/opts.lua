local vim = vim
vim.api.nvim_command('syntax off')
local icons = require('chiddy.new_utils.icons')
local indent = 4
local iter = vim.iter
local g = vim.g
local opt = vim.o
-- local opti = vim.opt

---@param options string[]
---@return string
local function list(options)
    local opts = table.concat(vim.tbl_islist(options) and options or iter.map(function(key, value)
        return string.format('%s:%s', key, value)
    end, options), ',')

    return opts
end

g.mapleader = ' '
g.maplocalleader = ' '
g.skip_ts_context_commentstring_module = true

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
opt.clipboard = 'unnamedplus,unnamed'
opt.shada = "'10,s10,h"
-- opt.shadafile = vim.fn.stdpath('state') .. '/shada/main.shada'
opt.shadafile = string.format('%s%s', vim.fn.stdpath('state'), '/shada/main.shada')
-- opt.shadafile = 'NONE'
opt.conceallevel = 3
opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
opt.grepformat = '%f:%l:%c:%m'
opt.laststatus = 2
opt.cmdheight = 1
-- opt.wildmenu = true
opt.wildmode = 'longest:full,full'
opt.autoindent = true
opt.confirm = true
opt.completeopt = 'menu,menuone,noselect'
-- opt.completeopt = {
--     'menu',
--     'menuone',
--     'noselect',
-- }
opt.mouse = 'a' -- to visually select and copy from vim without line numbers
opt.mousemoveevent = true
opt.lazyredraw = false -- dont redraw whileexecuting macros (performance)
opt.ttyfast = true -- dont redraw while executing macros (performance)
opt.hlsearch = false -- keep search cunks highlighted
opt.tagcase = 'ignore' -- search case-sensitive
opt.ignorecase = true -- search case-sensitive
opt.smartcase = true -- if pattern contains capital it becomes case sensitive
opt.smartindent = true -- smarter indentation
opt.smarttab = true -- make tab smartter
opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.writebackup = false
opt.backup = false
opt.backupskip = '/tmp/*,/private/tmp/*'
opt.backupdir = string.format('%s%s', vim.fn.stdpath('state'), '/backup')
opt.startofline = false
opt.showcmd = true -- show what commands you are typing, what you select in visual mode, etc
opt.showmode = false
opt.showmatch = false -- highlight  matching [{()}]
opt.scrolloff = 8 -- how many lines til window border to see when scrolling
opt.smoothscroll = true
opt.sidescroll = 2
opt.sidescrolloff = 15 -- same as above but for columns
opt.inccommand = 'nosplit' -- incremental search (enabled by default)
opt.joinspaces = false -- no double spaces with join after a dot
opt.updatetime = 50 -- timeout for showing cursorhold events, etc
opt.shortmess = 'aoOtTWAIqF' -- better messages
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
opt.breakindent = true
opt.number = true -- show line umber
opt.numberwidth = 1 -- by default 4, and because of that there is empty space to the right of line umbers except current
opt.relativenumber = true --show relative line number for the current line
-- cursorcolumn = true, --gihlight the current column
opt.colorcolumn = '' -- "80,120", -- highlight some column length
opt.wildignorecase = true
opt.spell = false
opt.cursorline = true -- highlight the screen line of the cursor with Cursorline
opt.modeline = true
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
opt.formatoptions = 'jcroqlnt2'
-- opti.formatoptions = {
--     ['1'] = true, -- dont break a line after a one letter word
--     ['2'] = true, -- use indent of the second line of a paragraph for the rest of the paragraph instead of the first
--     c = true, -- wrap comments using textwidth
--     j = true, -- remove a comment leader when joining lines
--     l = true, -- long lines arent broken in insert mode
--     n = true, -- recognize numbered lists
--     o = true, -- insert comment leader after hitting 'o' or 'O' in normal mode
--     q = true, -- allow formatting comments with 'gq'
--     r = true, -- insert comment leader after hitting <enter> in insert mode
--     t = false, -- wrap text using textwidth
-- }
-- opt.shell = 'zsh'
-- opt.syntax = 'off'
opt.fillchars = list({
    eob = ' ',
    foldopen = icons.misc.arrow.down.normal,
    foldclose = icons.misc.arrow.right.normal,
    foldsep = ' ',
    fold = ' ',
    diff = '/',
})
-- opti.fillchars = {
--     eob = ' ',
--     foldopen = icons.ui.ArrowOpen,
--     foldclose = icons.ui.ArrowClosed,
--     foldsep = ' ',
--     fold = ' ',
--     diff = '/',
-- }
opt.listchars = list({
    trail = icons.misc.circle.dot,
    tab = string.format('%s ', icons.chevron.double.right),
    extends = icons.misc.bracket.right,
    precedes = icons.misc.bracket.left,
    nbsp = '_',
    space = ' ',
})
-- opti.listchars = {
--     trail = icons.ui.Circle,
--     tab = icons.ui.DoubleSeparator .. ' ',
--     extends = icons.ui.BracketRight,
--     precedes = icons.ui.BracketLeft,
--     nbsp = '_',
--     space = ' ',
-- }
opt.sessionoptions = list({
    'buffers',
    'curdir',
    'tabpages',
    'winsize',
})
-- opti.sessionoptions = {
--     'buffers',
--     'curdir',
--     'tabpages',
--     'winsize',
-- }
-- opt.splitkeep = 'screen'
-- ignore files vim doesnt use
-- opt.wildignore = list({
--     -- '*.aux',
--     -- '*.out',
--     -- '*.toc',
--     -- '*.o',
--     -- '*.obj',
--     -- '*.dll',
--     -- '*.jar',
--     -- '*.pyc',
--     -- '*.aux',
--     -- '*.class',
--     -- '*.gif',
--     -- '*.ico',
--     -- '*.jpg',
--     -- '*.jpeg',
--     -- '*.png',
--     -- '*.avi',
--     -- '*.wav',
--     -- '*.webm',
--     -- '*.mp4',
--     -- '*.eot',
--     -- '*.otf',
--     -- '*.ttf',
--     -- '*.woff',
--     -- '*.mp3',
--     -- '*.zip',
--     -- '*.tar.gz',
--     -- '*.tar.bz2',
--     -- '*.rar',
--     -- '*.tar.xz',
--     -- '.sass-cache',
--     -- '*/vendor/gems/*',
--     -- '*/vendor/cache/*',
--     -- '*/.bundle/*',
--     -- '*.gem',
--     -- '*.*~',
--     -- '*~ ',
--     -- '*.swp',
--     -- '.lock',
--     -- '.DS_Store',
--     -- '._*',
--     -- 'tags.lock',
--     '*.aux',
--     '*.out',
--     '*.toc',
--     '*.o',
--     '*.obj',
--     '*.exe',
--     '*.dll',
--     '*.manifest',
--     '*.rbc',
--     '*.class',
--     '*.jar',
--     '*.au',
--     '*.bmp',
--     '*.gif',
--     '*.ico',
--     '*.jpg',
--     '*.jpeg',
--     '*.png',
--     '*.psd',
--     '*.webp',
--     '*.avi',
--     '*.divx',
--     '*.mp4',
--     '*.webm',
--     '*.mov',
--     '*.m2ts',
--     '*.mkv',
--     '*.cob',
--     '*.mpg',
--     '*.mpeg',
--     '*.mp3',
--     '*.oga',
--     '*.ogg',
--     '*.wav',
--     '*.flac',
--     '*.eot',
--     '*.otf',
--     '*.ttf',
--     '*.woff',
--     '*.pdf',
--     '*.cbr',
--     '*.cbz',
--     '*.zip',
--     '*.tar.gz',
--     '*.tar.bz2',
--     '*.rar',
--     '*.tar.xz',
--     '*.kgb',
--     '*.swp',
--     '.lock',
--     '.DS_Store',
--     '._*',
--     '.sass-cache',
-- })
-- opti.wildignore:append('.git,.hg,.svn')
-- opti.wildignore:append('.aux,*.out,*.toc')
-- opti.wildignore:append('.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class,*.jar')
-- opti.wildignore:append('.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp')
-- opti.wildignore:append('.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg')
-- opti.wildignore:append('.mp3,*.oga,*.ogg,*.wav,*.flac')
-- opti.wildignore:append('.eot,*.otf,*.ttf,*.woff')
-- opti.wildignore:append('.doc,*.pdf,*.cbr,*.cbz')
-- opti.wildignore:append('.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb')
-- opti.wildignore:append('.swp,.lock,.DS_Store,._*')
-- opt.wildignore:append(".,..")

-- opt.wildignore = {
--     '*.aux',
--     '*.out',
--     '*.toc',
--     '*.o',
--     '*.obj',
--     '*.dll',
--     '*.jar',
--     '*.pyc',
--     '*.aux',
--     '*.class',
--     '*.gif',
--     '*.ico',
--     '*.jpg',
--     '*.jpeg',
--     '*.png',
--     '*.avi',
--     '*.wav',
--     '*.webm',
--     '*.mp4',
--     '*.eot',
--     '*.otf',
--     '*.ttf',
--     '*.woff',
--     '*.mp3',
--     '*.zip',
--     '*.tar.gz',
--     '*.tar.bz2',
--     '*.rar',
--     '*.tar.xz',
--     '.sass-cache',
--     '*/vendor/gems/*',
--     '*/vendor/cache/*',
--     '*/.bundle/*',
--     '*.gem',
--     '*.*~',
--     '*~ ',
--     '*.swp',
--     '.lock',
--     '.DS_Store',
--     '._*',
--     'tags.lock',
-- }

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

-- vim.cmd('syntax off')
-- vim.cmd.syntax('off')
