return function(client, buffer)
    local cap = client.server_capabilities
    local maps = {
        c = {
            name = '+code/lsp',
            --TODO:language specific bindings with cond
            a = { vim.lsp.buf.code_action, 'code action' },
            f = {
                { ':Format<cr>', 'format', cond = cap.documentFormating },
                { ':Format<cr>', 'format', cond = cap.documentRangeFormating, mode = 'x' },
            },
            d = { vim.diagnostic.open_float, 'line diagnostics' },
            l = {
                name = '+lsp server',
                i = { '<cmd>LspInfo<cr>', 'info' },
                a = { vim.lsp.buf.add_workspace_folder, 'add folder' },
                r = { vim.lsp.buf.remove_workspace_folder, 'remove folder' },
                l = {
                    function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end,
                    'list folders',
                },
                m = {
                    function()
                        require('mason.ui').open()
                    end,
                    'mason',
                },
            },
        },
        x = {
            name = '+errors',
            d = {
                function()
                    require('telescope.builtin').diagnostics()
                end,
                'search diagnostics',
            },
        },
        r = {
            name = '+refactor',
            n = {
                function()
                    return ':IncRename ' .. vim.fn.expand('<cword>')
                end,
                'rename',
                cond = cap.renameProvider,
                expr = true,
            },
            s = {
                function()
                    require('ssr').open()
                end,
                'structural rename',
            },
        },
        g = {
            name = '+goto',
            d = {
                function()
                    require('telescope.builtin').lsp_definitions()
                end,
                'definition',
            },
            r = {
                function()
                    require('telescope.builtin').lsp_references()
                end,
                'references',
            },
            R = {
                function()
                    require('trouble').toggle({ mode = 'lsp_references' })
                end,
                'trouble references',
            },
            D = {
                function()
                    require('telescope.builtin').lsp_declarations()
                end,
                'declaration',
            },
            i = {
                function()
                    require('telescope.builtin').lsp_implementations()
                end,
                'implementations',
            },
            t = {
                function()
                    require('telescope.builtin').lsp_type_definitions()
                end,
                'type defs',
            },
        },
        d = {
            name = '+diagnostics',
            n = { vim.diagnostic.goto_next, 'goto next' },
            N = { vim.diagnostic.goto_prev, 'goto prev' },
            d = { vim.diagnostic.open_float, 'open current' },
        },
        j = {
            name = '+treesitter',
            j = {
                function()
                    require('treesj').toggle()
                end,
                'toggle split/join',
            },
            p = {
                function()
                    require('tree-climber').goto_child()
                end,
                'goto child',
            },
            P = {
                function()
                    require('tree-climber').goto_parent()
                end,
                'goto parent',
            },
            n = {
                function()
                    require('tree-climber').goto_next()
                end,
                'goto next',
            },
            N = {
                function()
                    require('tree-climber').goto_prev()
                end,
                'goto prev',
            },
            s = {
                function()
                    require('tree-climber').swap_next()
                end,
                'swap next',
            },
            S = {
                function()
                    require('tree-climber').swap_prev()
                end,
                'swap prev',
            },
            h = {
                function()
                    require('tree-climber').highlight_node()
                end,
                'highlight node',
            },
        },
        u = {
            name = '+folds/ufo',
            O = {
                function()
                    require('ufo').openAllFolds()
                end,
                'open all folds',
            },
            C = {
                function()
                    require('ufo').closeAllFolds()
                end,
                'close all folds',
            },
        },
    }

    local keys = {
        ['<C-k>'] = {
            vim.lsp.buf_signature_help,
            'signature help',
            mode = { 'n', 'i' },
        },
        K = {
            function()
                -- local winid = require('ufo').peekFoldedLinesUnderCursor()
                -- if not winid then
                vim.lsp.buf.hover()
                -- end
            end,
            'hover',
        },
    }
    local wk = require('which-key')
    wk.register(maps, { prefix = '<leader>', buffer = buffer, noremap = true })
    wk.register(keys, { buffer = buffer, noremap = true })
end
