-- efm general language server
local clazy = require('efmls-configs.linters.clazy')
local selene = require('efmls-configs.linters.selene')
local clang_tidy = require('efmls-configs.linters.clang_tidy')
local eslint_d = require('efmls-configs.linters.eslint_d')
local djlint = require('efmls-configs.linters.djlint')
local golangci_lint = require('efmls-configs.linters.golangci_lint')

local languages = {
    cpp = { clazy, clang_tidy },
    c = { clazy, clang_tidy },
    lua = { selene },
    javascript = { eslint_d },
    javascriptreact = { eslint_d },
    typescript = { eslint_d },
    typescriptreact = { eslint_d },
    html = { djlint },
    go = { golangci_lint },
}
local M = {}
M.config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { '.git/' },
        languages = languages,
    },
    init_options = {
        documentFormatting = false,
        documentRangeFormatting = false,
    },
}

return M
