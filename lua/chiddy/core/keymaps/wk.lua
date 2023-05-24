-- require('Comment.api').toggle.linewise.current()
local wk = require('which-key')
local maps = {
    w = {
        name = '+window',
    },
    c = {
        name = '+code/lsp',
    },
    b = {
        name = '+buffer',
        b = { '<cmd>:e #<cr>', 'switch to other buffer' },
        --TODO:BufferLineCycle
    },
    r = {
        name = '+refactor',
    },
    G = {
        name = '+git',
        --TODO:git
        o = {
            function()
                require('telescope.builtin').git_status()
            end,
            'open changed file',
        },
        b = {
            function()
                require('telescope.builtin').git_branches()
            end,
            'checkout branch',
        },
        c = {
            function()
                require('telescope.builtin').git_commits()
            end,
            'checkout commits',
        },
    },
    h = {
        name = '+help',
        t = {
            function()
                require('telescope.builtin').builtin()
            end,
            'telescope',
        },
        c = {
            function()
                require('telescope.builtin').commands()
            end,
            'commands',
        },
        h = {
            function()
                require('telescope.builtin').help_tags()
            end,
            'help pages',
        },
        m = {
            function()
                require('telescope.builtin').man_tags()
            end,
            'man pages',
        },
        k = {
            function()
                require('telescope.builtin').keymaps()
            end,
            'keymaps',
        },
        H = {
            function()
                require('telescope.builtin').highlights()
            end,
            'highlights',
        },
        f = {
            function()
                require('telescope.builtin').filetypes()
            end,
            'file types',
        },
        o = {
            function()
                require('telescope.builtin').vim_options()
            end,
            'options',
        },
        a = {
            function()
                require('telescope.builtin').autocommands()
            end,
            'autocommands',
        },
        r = {
            function()
                require('telescope.builtin').registers()
            end,
            'registers',
        },
        l = {
            vim.show_pos,
            'highlights at cursor',
        },
        p = {
            name = '+plugins',
            h = {
                function()
                    require('lazy').home()
                end,
                'home',
            },
            s = {
                function()
                    require('lazy').sync()
                end,
                'sync',
            },
            u = {
                function()
                    require('lazy').update()
                end,
                'update',
            },
            l = {
                function()
                    require('lazy').log()
                end,
                'log',
            },
            c = {
                function()
                    require('lazy').check()
                end,
                'check',
            },
            d = {
                function()
                    require('lazy').debug()
                end,
                'debug',
            },
            p = {
                function()
                    require('lazy').profile()
                end,
                'profile',
            },
        },
    },
    s = {
        name = '+search',
        g = {
            function()
                require('telescope.builtin').live_grep()
            end,
            'grep',
        },
        b = {
            function()
                require('telescope.builtin').current_buffer_fuzzy_find()
            end,
            'buffer',
        },
        s = {
            function()
                require('telescope.builtin').lsp_document_symbols({
                    symbols = {
                        'Class',
                        'Function',
                        'Method',
                        'Constructor',
                        'Interface',
                        'Module',
                        'Struct',
                        'Trait',
                        'Field',
                        'Property',
                    },
                })
            end,
            'symbol',
        },
        h = {
            function()
                require('telescope.builtin').command_history()
            end,
            'command history',
        },
        m = {
            function()
                require('telescope.builtin').marks()
            end,
            'marks',
        },
        n = {
            function()
                require('telescope').extensions.notify.notify()
            end,
            'notify',
        },
        p = {
            function()
                require('telescope').extensions.projects.projects()
            end,
            'list',
        },
        S = {
            function()
                require('telescope').extensions.luasnip.luasnip()
            end,
            'snippets',
        },
    },
    f = {
        name = '+files',
        f = {
            function()
                require('telescope.builtin').find_files()
            end,
            'find files',
        },
        r = {
            function()
                require('telescope.builtin').oldfiles()
            end,
            'old files',
        },
        n = { '<cmd>enew<cr>', 'new file' },
        b = {
            function()
                require('telescope.builtin').buffers()
            end,
            'buffers',
        },
    },
    o = {
        name = '+open',
    },
    t = {
        name = '+toggle',
        f = {
            function()
                require('chiddy.core.config').lsp.format_on_save = not require('chiddy.core.config').lsp.format_on_save
            end,
            'format on save',
        },
        s = {
            function()
                require('chiddy.utils.api').toggle('spell')
            end,
            'spelling',
        },
        w = {
            function()
                require('chiddy.utils.api').toggle('wrap')
            end,
            'word wrap',
        },
        n = {
            function()
                require('chiddy.utils.api').toggle('relativenumber', true)
                require('chiddy.utils.api').toggle('number')
            end,
            'line numbers',
        },
    },
    ['<tab>'] = {
        name = '+tabs',
        ['<tab>'] = { '<cmd>tabnew<cr>', 'new tab' },
        n = { '<cmd>tabnext<cr>', 'next' },
        N = { '<cmd>tabprevious<cr>', 'prev' },
        c = { '<cmd>tabclose<cr>', 'close' },
        f = { '<cmd>tabfirst<cr>', 'first' },
        l = { '<cmd>tablast<cr>', 'last' },
    },
    q = {
        name = '+quit/session',
        q = { '<cmd>qa<cr>', 'quit' },
        ['!'] = { '<cmd>qa!<cr>', 'force quit' },
    },
    x = {
        name = '+errors',
        x = {
            function()
                require('trouble').toggle()
            end,
            'trouble',
        },
        t = {
            function()
                require('trouble').toggle({ mode = 'todo' })
            end,
            'trouble todo',
        },
        T = {
            function()
                require('telescope').extensions['todo-comments'].todo()
            end,
            'todo',
        },
        l = { '<cmd>lopen<cr>', 'open location list' },
        q = { '<cmd>copen<cr>', 'open quickfix list' },
    },
    n = {
        name = '+noice',
        h = {
            function()
                require('noice').cmd('history')
            end,
            'history',
        },
        l = {
            function()
                require('noice').cmd('last')
            end,
            'last',
        },
        e = {
            function()
                require('noice').cmd('errors')
            end,
            'errors',
        },
        t = {
            function()
                require('noice').cmd('telescope')
            end,
            'telescope',
        },
        s = {
            function()
                require('noice').cmd('stats')
            end,
            'stats',
        },
        m = {
            function()
                require('noice').cmd('messages')
            end,
            'messages',
        },
    },
    R = {
        name = '+run/compile',
        --TODO:run/compile
    },
    T = {
        name = '+tests',
        --TODO:tests
        o = {
            name = '+overseer',
            o = {
                function()
                    require('overseer').toggle()
                end,
                'toggle',
            },
            t = {
                name = '+test',
                t = {
                    function()
                        require('neotest').overseer.run()
                    end,
                    'test',
                },
                T = {
                    function()
                        require('neotest').overseer.run(vim.fn.expand('%'))
                    end,
                    'test cur file',
                },
                d = {
                    function()
                        require('neotest').overseer.run({ strategy = 'dap' })
                    end,
                    'dap',
                },
                s = {
                    function()
                        require('neotest').overseer.stop()
                    end,
                    'stop',
                },
                a = {
                    function()
                        require('neotest').overseer.attach()
                    end,
                    'attach',
                },
            },
        },
    },
    D = {
        name = '+debug',
        --TODO:debug
        b = {
            name = '+breakpoint',
            p = {
                function()
                    require('dap').toggle_breakpoint()
                end,
                'breakpoint',
            },
            c = {
                function()
                    require('dap').set_breakpoint(vim.fn.input('breakpoint condition: '))
                end,
                'conditional',
            },
            l = {
                function()
                    require('dap').set_breakpoint(nil, nil, vim.fn.input('log point message: '))()
                end,
                'logpoint',
            },
        },
        c = {
            function()
                require('dap').continue()
            end,
            'continue',
        },
        C = {
            function()
                require('dap').run_to_cursor()
            end,
            'continue',
        },
        i = {
            function()
                require('dap').step_into()
            end,
            'into',
        },
        o = {
            function()
                require('dap').step_over()
            end,
            'over',
        },
        O = {
            function()
                require('dap').step_out()
            end,
            'out',
        },
        r = {
            function()
                require('dap').repl_toggle()
            end,
            'repl',
        },
        l = {
            function()
                require('dap').run_last()
            end,
            'last',
        },
        u = {
            function()
                require('dapui').toggle({})
            end,
            'ui',
        },
        x = {
            function()
                require('dap').terminate()
            end,
            'exit',
        },
    },
    O = {
        name = '+notes/org',
        --TODO:notes/org
    },
    -- lone keys
    --TODO:lone keys
    C = {
        function()
            require('neogen').generate()
        end,
        'neogen',
    },
}

local keys = {
    ['<C-f>'] = {
        function()
            require('neo-tree.command').execute({
                action = 'focus',
                toggle = true,
                reveal = true,
                source = 'filesystem',
                position = 'left',
            })
        end,
        'toggle filetree',
    },
    ['<C-l>'] = {
        function()
            wk.show_command()
        end,
        'show keymaps',
    },
    p = {
        function()
            require('yanky').put('p', false)
        end,
        'paste after',
        silent = true,
    },
    P = {
        function()
            require('yanky').put('P', false)
        end,
        'paste before',
        silent = true,
    },
    -- move lines
    -- ['<A-j>'] = {
    --     -- { ':m .+1<CR>==', 'move line down', mode = 'n' },
    --     -- { ":m '>+1<CR>gv=gv", 'move line down', mode = { 'v', 'x' } },
    --     -- { '<ESC>:m .+1<CR>==gi', 'move line down', mode = 'i' },
    --     'move line down',
    -- },
    -- ['<A-k>'] = {
    --     -- { ':m .-2<CR>==', 'move line up', mode = 'n' },
    --     -- { ":m '<-2<CR>gv=gv", 'move line up', mode = { 'v', 'x' } },
    --     -- { '<ESC>:m .-2<CR>==gi', 'move line up', mode = 'i' },
    --     'move line up',
    -- },
    -- ['<A-j>'] = {
    --     {
    --         function()
    --             require('moveline').down()
    --         end,
    --         'move line down',
    --         mode = 'n',
    --     },
    --     {
    --         function()
    --             require('moveline').block_down()
    --         end,
    --         'move line down (block)',
    --         mode = 'v',
    --     },
    --     'move line down',
    -- },
    -- ['<A-k>'] = {
    --     function()
    --         require('moveline').up()
    --     end,
    --     'move line up',
    -- },
    -- indent
    ['<'] = { '<gv', 'indent', mode = 'x' },
    ['>'] = { '>gv', 'indent', mode = 'x' },
    -- clear search
    ['<ESC>'] = { '<cmd>noh<cr><esc>', mode = { 'i', 'n' } },
    -- dial
    ['<C-a>'] = {
        function()
            -- require('dial.map').inc_normal()
            require('dial.command').select_augend_normal()
            require('dial.command').textobj()
            require('dial.command').operator_normal('increment')
        end,
        'increment',
    },
    ['<C-d>'] = {
        -- require('dial.map').dec_normal(),
        function()
            require('dial.command').select_augend_normal()
            require('dial.command').textobj()
            require('dial.command').operator_normal('decrement')
        end,
        'decrement',
    },
    -- comments
    ['<C-c>'] = {
        {
            function()
                require('Comment.api').toggle.linewise.current()
            end,
            'toggle linewise comments',
        },
        {
            function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
                require('Comment.api').toggle.linewise(vim.fn.visualmode())
            end,
            'toggle linewise comments',
            mode = 'x',
        },
    },
}
-- wk.register(keymap)
wk.register(maps, { prefix = '<leader>', noremap = true })
wk.register(keys, { noremap = true })
