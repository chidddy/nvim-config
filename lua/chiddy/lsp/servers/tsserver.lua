-- lua
local M = {}
M.config = {
    init_options = {
        hostInfo = 'neovim',
        preferences = {
            includeCompletionsForImportStatements = true,
            includeCompletionsForModuleExports = true,
            includeAutomaticOptionalChainCompletions = true,
            includeCompletionsWithClassMemberSnippets = true,
            jsxAttributeCompletionStyle = 'braces',
            importModuleSpecifierEnding = 'minimal',
            includeCompletionsWithObjectLiteralMethodSnippets = true,
        },
    },
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
        implicitProjectConfiguration = {
            checkJs = true,
            module = 'ESNext',
            target = 'ESNext',
            experimentalDecorators = true,
        },
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
    -- settings = {
    -- },
}

return M
