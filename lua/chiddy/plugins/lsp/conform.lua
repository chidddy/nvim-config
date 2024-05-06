---@class LazyPlugin
local plugin = {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
}

function plugin.config()
    require('conform').setup({
        -- config
        formatters_by_ft = {
            lua = { 'stylua' },
            svelte = {
                { 'biome' },
            },
            astro = {
                { 'biome' },
            },
            javascript = {
                { 'biome' },
            },
            javascriptreact = {
                { 'biome' },
            },
            typescript = {
                { 'biome' },
            },
            typescriptreact = {
                { 'biome' },
            },
            python = { 'black' },
            markdown = { 'markdownlint' },
            cmake = { 'cmake_format' },
            toml = { 'taplo' },
            rust = { 'rustfmt' },
            go = { 'gofmt' },
            bash = { 'shfmt' },
            -- cpp = { { 'uncrustify', 'clang_format' } },
            cpp = { 'clang_format' },
        },
        -- Set the log level. Use `:ConformInfo` to see the location of the log file.
        log_level = vim.log.levels.DEBUG,
        -- Conform will notify you when a formatter errors
        notify_on_error = true,
        format_on_save = function(_bufnr)
            if require('chiddy.core.config').lsp.format_on_save == true then
                return { timeout_ms = 500, lsp_fallback = true }
            end

            return
        end,
        formatters = {
            shfmt = {
                prepend_args = { '--config-path', vim.fn.expand('~/.config/nvim/.stylua.toml') },
            },
            -- prettierd = {
            --     command = require('conform.util').find_executable({
            --         vim.fn.expand('~/.cache/.bun/bin/prettierd'),
            --     }, 'prettierd'),
            --     env = {
            --         PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.config/nvim/.prettierrc.json'),
            --     },
            -- },
            uncrustify = {
                prepend_args = function(self, ctx)
                    local found = vim.fs.find('uncrustify.cfg', { upward = true, path = ctx.dirname })[1]
                    if found then
                        return { '-c', found }
                    end
                    return {}
                end,
            },
        },
    })
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return plugin
