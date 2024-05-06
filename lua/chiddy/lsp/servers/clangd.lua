local U = require('chiddy.utils.lsp')
local luv = require('luv')

local cpu = luv.available_parallelism()
local cap = U.capabilities()
cap.offsetEncoding = 'utf-8'

local M = {}
M.config = {
    capabilities = cap,
    cmd = {
        'clangd',
        -- '--offset-encoding=utf-8',
        '--background-index',
        -- '--completion-style=detailed',
        '--pch-storage=memory',
        '--enable-config',
        '--function-arg-placeholders',
        '--clang-tidy',
        '--limit-references=3000',
        '--limit-results=350',
        -- '--log=error',
        string.format('-j=%d', (cpu / 2)),
    },
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
    },
    single_file_support = true,
}
return M
