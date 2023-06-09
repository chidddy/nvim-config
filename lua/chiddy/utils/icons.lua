local icons = {
    kind = {
        -- Class = " ",
        -- Constructor = "",
        -- Keyword = "",
        -- Method = "m",
        -- Module = "",
        -- Snippet = " ",
        -- Class = "",
        Class = 'ﴯ',
        Color = '',
        Constant = '',
        Constructor = '',
        Enum = '',
        EnumMember = '',
        Event = '',
        Field = '',
        File = '',
        Folder = '',
        Function = '',
        Interface = '',
        Keyword = '',
        Method = '',
        -- Module = "",
        Module = '',
        Namespace = '',
        Number = '#',
        Operator = '',
        -- Package = "",
        Package = '',
        Property = 'ﰠ',
        Reference = '',
        Snippet = '',
        Struct = '',
        Text = '',
        TypeParameter = '',
        Unit = '',
        Value = '',
        Variable = '',
        -- ccls-specific icons.
        TypeAlias = '',
        Parameter = '',
        StaticMethod = '',
        Macro = '',
    },
    type = {
        -- Array = "",
        Array = '',
        Boolean = '',
        Null = 'ﳠ',
        Number = '#',
        Object = '⦿',
        String = '',
    },
    documents = {
        Default = '',
        File = '',
        Files = '',
        FileTree = 'פּ',
        Symlink = '',
    },
    git = {
        Add = '落',
        Add_alt = '',
        Branch = '',
        Diff = '',
        Git = '',
        Ignore = '',
        Mod = 'ﭦ ',
        Mod_alt = '',
        Remove = ' ',
        Remove_alt = '',
        Rename = '',
        Repo = '',
        Unmerged = 'שׂ',
        Untracked = 'U',
        Unstaged = '',
        Staged = '',
        Conflict = '',
    },
    ui = {
        ArrowClosed = '',
        ArrowOpen = '',
        BigCircle = '',
        BigUnfilledCircle = '',
        BigCircleDot = '',
        BookMark = '',
        Bug = '',
        Calendar = '',
        Check = '',
        CheckCircle = '',
        ChevronRight = '',
        BracketRight = '❯',
        BracketLeft = '❮',
        Circle = '•',
        Close = '',
        Close_alt = '',
        CloudDownload = '',
        Comment = '',
        Dashboard = '',
        Document = '',
        DoubleSeparator = '',
        Emoji = '',
        EmptyFolder = '',
        EmptyFolderOpen = '',
        File = '',
        Fire = '',
        Folder = '',
        FolderOpen = '',
        Gear = '',
        History = '',
        Indicator = '',
        Left = '',
        Lightbulb = '',
        List = '',
        Lock = '',
        LongDash = '—',
        Modified = '✥',
        Modified_alt = '',
        NewFile = '',
        Note = '',
        Package = '',
        Pencil = '',
        Perf = '',
        Project = '',
        Right = '',
        Search = '',
        SearchFile = '',
        Separator = '',
        SignIn = '',
        SignOut = '',
        Sort = '',
        Spell = '暈',
        Symlink = '',
        SymlinkFolder = '',
        Table = '',
        Truncate = '…',
        Trash = 'ﮁ',
        Telescope = '',
        Clock = '',
        Bell = '󰂚',
        NoBell = '󰂛',
        Light = 'ﯦ',
        Light_alt = 'ﯧ',
        Wind = '',
    },
    diagnostics = {
        Error = '',
        Warning = '',
        Information = '',
        Question = '',
        Hint = '',
        -- Holo version
        Error_alt = '',
        Warning_alt = '',
        Information_alt = '',
        Question_alt = '',
        Hint_alt = '',
    },
    misc = {
        Ball = '',
        Campass = '',
        Code = '',
        EscapeST = '✺',
        Gavel = '',
        Glass = '',
        PyEnv = '',
        Squirrel = '',
        Tag = '',
        Tree = '',
        Watch = '',
        Lego = '',
        Vbar = '│',
        Add = '+',
        Added = '',
        Ghost = '',
        ManUp = '',
        VIM = '',
        Plug = '',
        Terminal = '',
        Rainbow = '🌈',
        Slash = '',
    },
    cmp = {
        Copilot = '',
        Copilot_alt = '',
        nvim_lsp = '',
        nvim_lua = '',
        path = '',
        buffer = ' ',
        spell = '暈',
        luasnip = '',
        treesitter = '',
    },
    dap = {
        Breakpoint = 'ß',
        BreakpointCondition = 'ﳁ',
        BreakpointRejected = '',
        LogPoint = '',
        Pause = '',
        Play = '',
        RunLast = '↻',
        StepBack = '',
        StepInto = '',
        StepOut = '',
        StepOver = '',
        Stopped = 'ඞ',
        Terminate = 'ﱢ',
    },
    sep = {
        VerticalBar = '┃',
        VerticalBarThin = '│',
        Left = '',
        Right = '',
        Block = '█',
        LeftFilled = '',
        RightFilled = '',
        SlantLeft = '',
        SlantLeftThin = '',
        SlantRight = '',
        SlantRightThin = '',
        SlantLeft_alt = '',
        SlantLeftThin_alt = '',
        SlantRight_alt = '',
        SlantRightThin_alt = '',
        LeftRounded = '',
        LeftRoundedThin = '',
        RightRounded = '',
        RightRoundedThin = '',
    },
}

for k, _ in pairs(icons) do
    setmetatable(icons[k], {
        __index = function(self, key)
            if string.sub(key, -1) == '_' then
                return self[string.sub(key, 1, -2)] .. ' '
            end
            return self[key] .. (self._concat or '')
        end,
        __call = function(self, v)
            self._concat = v
            return self
        end,
    })
end

return icons
