---@class LazyPlugin
local M = {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPost',
}

function M.config()
    local nls = require('null-ls')
    local U = require('chiddy.utils.lsp')

    local dgn = nls.builtins.diagnostics
    local cda = nls.builtins.code_actions

    -- configuring
    nls.setup({
        sources = {
            -- diagnostics
            dgn.eslint_d.with({
                condition = function(utils)
                    return utils.root_has_file_matches('eslint')
                end,
                filter = function(diagnostic)
                    return diagnostic.code ~= 'prettier/prettier'
                end,
                diagnostics_format = '[eslint_d] #{m}\n(#{c})',
            }),
            dgn.alex,
            dgn.shellcheck,
            dgn.luacheck,
            dgn.selene,
            dgn.markdownlint,
            dgn.trail_space,
            dgn.actionlint,
            dgn.checkmake,
            dgn.golangci_lint,
            dgn.clang_check,
            dgn.cmake_lint,
            dgn.cspell,
            dgn.zsh,

            -- code actions
            cda.eslint_d,
            cda.shellcheck,
            cda.refactoring,
        },
        on_attach = function(client, bufnr)
            U.default_on_attach(client, bufnr)
        end,
    })
end

return M
