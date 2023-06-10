---@class LazyPlugin
local M = {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'lukas-reineke/cmp-under-comparator',
        'saadparwaiz1/cmp_luasnip',
        -- 'doxnit/cmp-luasnip-choice',
    },
}

local function setup_highlights()
    local text = require('chiddy.ui.colors').get().text_dark
    local cutils = require('chiddy.utils.colors')
    local function hl(name)
        vim.api.nvim_set_hl(0, name, { fg = text, bg = cutils.get_hl_fg(name) })
    end

    hl('CmpItemKindField')
    hl('CmpItemKindProperty')
    hl('CmpItemKindEvent')
    hl('CmpItemKindText')
    hl('CmpItemKindEnum')
    hl('CmpItemKindKeyword')
    hl('CmpItemKindConstant')
    hl('CmpItemKindConstructor')
    hl('CmpItemKindReference')
    hl('CmpItemKindFunction')
    hl('CmpItemKindStruct')
    hl('CmpItemKindClass')
    hl('CmpItemKindModule')
    hl('CmpItemKindOperator')
    hl('CmpItemKindVariable')
    hl('CmpItemKindFile')
    hl('CmpItemKindUnit')
    hl('CmpItemKindSnippet')
    hl('CmpItemKindFolder')
    hl('CmpItemKindMethod')
    hl('CmpItemKindValue')
    hl('CmpItemKindEnumMember')
    hl('CmpItemKindInterface')
    hl('CmpItemKindColor')
    hl('CmpItemKindTypeParameter')
end

function M.config()
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    local cmp = require('cmp')
    local utils = require('chiddy.utils.cmp')
    local icons = {
        kind = require('chiddy.utils.icons').kind(' '),
        type = require('chiddy.utils.icons').type(' '),
        cmp = require('chiddy.utils.icons').cmp(' '),
    }
    setup_highlights()
    -- utils
    local ignore_text = function(entry, ctx)
        return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
    end

    -- setup
    -- local source_mapping = {
    --     treesitter = 'ts',
    --     path = 'path',
    --     luasnip = 'snip',
    --     nvim_lua = 'lua',
    --     nvim_lsp = 'lsp',
    --     buffer = 'buf',
    -- }
    local buffer_option = {
        get_bufnrs = function()
            local buf = vim.api.nvim_get_current_buf()
            local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
            if byte_size > 1024 * 1024 then
                return {}
            end
            return { buf }
        end,
    }
    cmp.setup({
        preselect = cmp.PreselectMode.None,
        window = {
            completion = {
                winhighlight = 'Normal:PMenu,FloatBorder:PMenu,Search:None',
                col_offset = -3,
                side_padding = 0,
                -- border = 'rounded',
                -- scrollbar = '║',
            },
            documentation = {
                border = 'rounded',
                scrollbar = '',
            },
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        mapping = cmp.mapping.preset.insert({
            -- ['<C-k>'] = cmp.mapping.select_prev_item(),
            -- ['<C-j>'] = cmp.mapping.select_next_item(),
            -- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-2), { 'i', 'c' }),
            -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(2), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<CR>'] = cmp.mapping.confirm({
                select = false,
                behavior = cmp.ConfirmBehavior.Insert,
            }),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                elseif utils.has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                    -- vim.cmd(':<')
                end
            end, { 'i', 's', 'c' }),
            -- todo finish
        }),

        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, vim_item)
                local kind = lspkind.cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 50,
                    symbol_map = vim.tbl_deep_extend('force', icons.kind, icons, cmp, icons.type),
                })(entry, vim_item)
                local strings = vim.split(kind.kind, '%s', { trimempty = true })
                local format_icon = strings[1] or ''
                local format_menu = strings[2] or ''
                kind.kind = ' ' .. format_icon .. ' '
                kind.menu = '    (' .. format_menu .. ')'
                return kind
            end,
            -- format = lspkind.cmp_format({
            --     mode = 'symbol_text',
            --     maxwidth = 50,
            --     ellipsis_char = '...',
            --     menu = source_mapping,
            --     symbol_map = vim.tbl_deep_extend('force', icons.kind, icons, cmp, icons.type),
            -- }),
        },

        -- installed sources
        sources = {
            { name = 'nvim_lsp', entry_filter = ignore_text },
            -- { name = 'nvim_lua' },
            { name = 'luasnip' },
            { name = 'luasnip_choice' },
            -- { name = 'path', max_item_countt = 5 },
            -- { name = 'neorg' },
            { name = 'buffer', max_item_count = 5 },
            -- { name = 'treesitter' },
            -- { name = 'calc' },
        },

        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                require('cmp-under-comparator').under,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },

        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        experimental = {
            ghost_text = false,
        },
        performance = {
            fetching_timeout = 300,
            debounce = 60,
            throttle = 30,
        },
    })
    -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
