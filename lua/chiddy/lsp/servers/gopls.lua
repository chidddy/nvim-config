-- go
local M = {}
M.config = {
    lsp_cfg = {
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        single_file_support = true,
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    unusedwrites = true,
                    shadow = true,
                    nilness = true,
                },
                staticcheck = true,
                usePlaceHolders = true,
            },
        },
    },
    trouble = true,
    luasnip = true,
    lsp_diag_update_on_insert = true,
    lsp_codelens = true,
    lsp_document_formatting = false,
    lsp_inlay_hints = {
        enable = false,
    },
    lsp_keymaps = false,
}

return M
