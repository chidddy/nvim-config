---@class LazyPlugin
local M = {
    'mhartington/formatter.nvim',
    cmd = { 'Format', 'FormatWrite' },
}

function M.config()
    local util = require('formatter.util')

    local function stylua()
        return {
            exe = 'stylua',
            args = {
                '--config-path',
                '~/.config/nvim/.stylua.toml',
                '--search-parent-directories',
                '--allow-hidden',
                '--stdin-filepath',
                util.escape_path(util.get_current_buffer_file_path()),
                '--',
                '-',
            },
            stdin = true,
        }
    end

    require('formatter').setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
            ['*'] = {
                require('formatter.filetypes.any').remove_trailing_whitespace,
            },
            lua = {
                -- require('formatter.filetypes.lua').stylua,
                stylua,
            },
            javascript = {
                require('formatter.filetypes.javascript').prettierd,
                require('formatter.filetypes.javascript').eslint_d,
            },
            javascriptreact = {
                require('formatter.filetypes.javascriptreact').prettierd,
                require('formatter.filetypes.javascriptreact').eslint_d,
            },
            typescript = {
                require('formatter.filetypes.typescript').prettierd,
                require('formatter.filetypes.typescript').eslint_d,
            },
            typescriptreact = {
                require('formatter.filetypes.typescriptreact').prettierd,
                require('formatter.filetypes.typescriptreact').eslint_d,
            },
            markdown = {
                require('formatter.filetypes.markdown').prettierd,
            },
            html = {
                require('formatter.filetypes.html').prettierd,
            },
            css = {
                require('formatter.filetypes.css').prettierd,
                require('formatter.filetypes.css').eslint_d,
            },
            json = {
                require('formatter.filetypes.json').prettierd,
            },
            yaml = {
                require('formatter.filetypes.yaml').prettierd,
            },
            toml = {
                require('formatter.filetypes.toml').taplo,
            },
            rust = {
                require('formatter.filetypes.rust').rustfmt,
            },
            go = {
                require('formatter.filetypes.go').gofmt,
            },
            c = {
                require('formatter.filetypes.c').clangformat,
                require('formatter.filetypes.c').uncrustify,
            },
            cpp = {
                require('formatter.filetypes.cpp').clangformat,
                require('formatter.filetypes.cpp').uncrustify,
            },
            cmake = {
                require('formatter.filetypes.cmake').cmakeformat,
            },
            sh = {
                require('formatter.filetypes.sh').shfmt,
            },
            python = {
                require('formatter.filetypes.python').black,
            },
        },
    })
end

return M
