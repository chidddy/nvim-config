-- TODO:
-- clangd C++ moment
-- local coq = require('coq')
-- require('clangd_extensions').setup(coq.lsp_ensure_capabilities(
local M = {}
M.config = {
    server = {
        cmd = {
            'clangd',
            '--background-index',
            '--pch-storage=memory',
            '--clang-tidy',
            '--all-scopes-completion',
            '--cross-file-rename',
            '--completion-style=detailed',
            '--header-insertion-decorated',
            '--header-insertion=iwyu',
            '--folding-ranges',
            '--offset-encoding=utf-16',
        },
        single_file_support = true,
    },
    extensions = {
        autoSetHints = false,
        inlay_hints = {
            only_current_line = false,
            only_current_line_autocmd = 'CursorHold',
            show_parameter_hints = true,
            parameter_hints_prefix = '<-',
            other_hints_prefix = '=>',
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = 'Comment',
            priority = 100,
        },
        memory_usage = {
            border = 'none',
        },
        symbol_info = {
            border = 'none',
        },
    },
}
return M
