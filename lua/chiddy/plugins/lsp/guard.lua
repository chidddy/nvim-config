---@class LazyPlugin
local plugin = {
    'nvimdev/guard.nvim',
    dependencies = {
        'nvimdev/guard-collection',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    enabled = false,
}

function plugin.config()
    local ft = require('guard.filetype')

    -- Assuming you have guard-collection
    -- ft('lang'):fmt('format-tool-1')
    --           :append('format-tool-2')
    --           :env(env_table)
    --           :lint('lint-tool-1')
    --           :extra(extra_args)

    -- local languages = {
    --     cpp = { clazy, clang_tidy },
    --     c = { clazy, clang_tidy },
    --     lua = { selene },
    --     javascript = { eslint_d },
    --     javascriptreact = { eslint_d },
    --     typescript = { eslint_d },
    --     typescriptreact = { eslint_d },
    --     html = { djlint },
    --     go = { golangci_lint },
    -- }

    ft('lua'):lint('selene')
    ft('javascript,typescript,typescriptreact,javascriptreact'):lint('eslint_d')
    ft('go'):lint('golangci_lint')
    ft('c,cpp'):lint('clang-tidy')
    -- ft('html'):lint('')

    -- dgn.eslint_d.with({
    --     condition = function(utils)
    --         return utils.root_has_file_matches('eslint')
    --     end,
    --     filter = function(diagnostic)
    --         return diagnostic.code ~= 'prettier/prettier'
    --     end,
    --     diagnostics_format = '[eslint_d] #{m}\n(#{c})',
    -- }),
    -- -- dgn.alex,
    -- dgn.luacheck,
    -- dgn.selene,
    -- -- dgn.markdownlint,
    -- dgn.trail_space,
    -- dgn.actionlint,
    -- dgn.checkmake,
    -- dgn.golangci_lint,
    -- dgn.clang_check,
    -- dgn.cmake_lint,
    -- -- dgn.cspell,
    -- dgn.zsh,

    -- Call setup() LAST!
    require('guard').setup({
        -- the only options for the setup function
        fmt_on_save = false,
        -- Use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = false,
    })
end

return plugin
