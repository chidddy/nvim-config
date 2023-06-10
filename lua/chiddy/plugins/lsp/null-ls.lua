---@class LazyPlugin
local M = {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPost',
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local function sync_save(client, bufnr)
    if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
                if require('chiddy.core.config').lsp.format_on_save == true then
                    vim.lsp.buf.format({
                        async = false,
                        bufnr = bufnr,
                        filter = function(format_client)
                            return format_client.name == 'null-ls'
                        end,
                    })
                end
            end,
        })
    end
end

function M.config()
    local nls = require('null-ls')
    local U = require('chiddy.utils.lsp')

    local dgn = nls.builtins.diagnostics
    local cda = nls.builtins.code_actions
    local fmt = nls.builtins.formatting

    -- configuring
    nls.setup({
        -- debug = true,
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

            -- formatting
            fmt.stylua.with({
                extra_args = { '--config-path', vim.fn.expand('~/.config/nvim/.stylua.toml') },
            }),
            fmt.black,
            fmt.markdownlint,
            fmt.taplo,
            fmt.gofmt,
            fmt.rustfmt.with({
                extra_args = { '--edition=2021' },
            }),
            fmt.prettierd.with({
                env = {
                    PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.config/nvim/.prettierrc.json'),
                },
            }),
            fmt.eslint_d,
            fmt.shfmt,
            fmt.cmake_format,
            fmt.uncrustify,
            fmt.clang_format,
        },
        on_attach = function(client, bufnr)
            U.default_on_attach(client, bufnr)
            sync_save(client, bufnr)
        end,
    })
end

return M
