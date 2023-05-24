-- lsp moment
local lsp = require('lspconfig')

local default = require('chiddy.lsp.servers.default')

local servers = require('chiddy.utils.tbl').merge_list(
    require('chiddy.core.config').lsp.servers.system,
    require('chiddy.core.config').lsp.servers.installer
)

local function config(name)
    local ok, settings = pcall(require, 'chiddy.lsp.servers.' .. name)
    if not ok then
        settings = default
    else
        settings.config = vim.tbl_deep_extend('force', default.config, settings.config)
    end
    return settings
end

vim.iter(servers):each(function(server)
    if server == 'rust_analyzer' then
        require('rust-tools').setup(config(server).config)
        -- lsp[server].setup(config(server).config.server)
    elseif server == 'clangd' then
        -- lsp[server].setup(config(server).config.server)
        require('clangd_extensions').setup(config(server).config)
    else
        lsp[server].setup(config(server).config)
    end
end)
