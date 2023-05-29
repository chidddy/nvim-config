local M = {}

M.mason = {
    bin = vim.fn.stdpath('data') .. '/mason/bin',
    package = vim.fn.stdpath('data') .. '/mason/packages',
}

return M
