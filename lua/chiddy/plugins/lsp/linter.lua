---@class LazyPlugin
local M = {
    'mfussenegger/nvim-lint',
}

function M.config()
    local lint = require('lint')

    local eslint_d_severity_map = {
        ['1'] = vim.diagnostic.severity.WARN,
        ['warn'] = vim.diagnostic.severity.WARN,
        ['warning'] = vim.diagnostic.severity.WARN,
        ['2'] = vim.diagnostic.severity.ERROR,
        ['error'] = vim.diagnostic.severity.ERROR,
    }
    lint.linters.eslint_d = {
        -- cmd = 'eslint_d',
        cmd = function()
            local local_eslint = vim.fn.fnamemodify('./node_modules/.bin/eslint_d', ':p')
            local stat = vim.loop.fs_stat(local_eslint)
            if stat then
                return local_eslint
            end
            return 'eslint_d'
        end,
        args = {
            '-f',
            'json-with-metadata',
            '--cache',
            '--stdin',
            '--stdin-filename',
            function()
                return vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
            end,
        },
        stdin = true,
        stream = 'stdout',
        ignore_exitcode = true,
        parser = function(raw_out)
            local output = vim.json.decode(raw_out)
            if vim.tbl_isempty(output) then
                return {}
            end
            local results = output.results[1]
            local metadata = output.metadata
            local diag = {}
            if #results.messages > 0 then
                for k = 1, #results.messages do
                    local message = results.messages[k]
                    -- for _, message in ipairs(results.messages) do
                    if message.fatal == true then
                        table.insert(diag, {
                            lnum = 1,
                            col = 1,
                            end_lnum = 1,
                            end_col = 1,
                            severity = eslint_d_severity_map[message.severity],
                            source = 'eslint_d',
                            code = 'none',
                            message = message.message,
                        })
                    else
                        if metadata.rulesMeta[message.ruleId].type ~= 'layout' then
                            table.insert(diag, {
                                lnum = message.line - 1,
                                col = message.column - 1,
                                end_lnum = message.endLine - 1,
                                end_col = message.endColumn - 1,
                                severity = eslint_d_severity_map[message.severity],
                                source = 'eslint_d',
                                code = message.ruleId,
                                message = message.message,
                                user_data = {
                                    lsp = {
                                        code = message.messageId,
                                        codeDescription = metadata.rulesMeta[message.ruleId].docs.description,
                                    },
                                },
                            })
                        end
                    end
                end
            end
            return diag
        end,
    }

    lint.linters_by_ft = {
        markdown = { 'vale' },
        cmake = { 'cmakelint' },
        cpp = { 'clang-tidy' },
        tsx = { 'eslint_d' },
        ts = { 'eslint_d' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        lua = { 'luacheck' },
    }
end

return M
