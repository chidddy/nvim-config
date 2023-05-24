-- eslint
local util = require('lspconfig.util')
local M = {}
local root_file = {
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
    'eslint.config.js',
    'package.json',
}
M.config = {
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'vue',
        'svelte',
        'astro',
    },
    settings = {
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = 'separateLine',
            },
            showDocumentation = {
                enable = true,
            },
        },
        codeActionOnSave = {
            enable = false,
            mode = 'all',
        },
        format = false,
        nodePath = '',
        onIgnoredFiles = 'off',
        packageManager = 'pnpm',
        quiet = false,
        rulesCustomizations = {},
        run = 'onType',
        useESLintClass = true,
        validade = 'on',
        workingDirectory = {
            mode = 'location',
        },
    },
    root_dir = util.root_pattern(unpack(root_file)),
}

return M
