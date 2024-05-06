return {
    require('chiddy.plugins.lsp.mason'),
    require('chiddy.plugins.lsp.lsp'),
    require('chiddy.plugins.lsp.formatter'),
    require('chiddy.plugins.lsp.null-ls'),
    require('chiddy.plugins.lsp.lightbulb'),
    require('chiddy.plugins.lsp.conform'),
    require('chiddy.plugins.lsp.guard'),
    require('chiddy.plugins.lsp.clangd_extensions'),
    require('chiddy.plugins.lsp.lens'),
    require('chiddy.plugins.lsp.diagflow'),
    -- require('chiddy.plugins.lsp.lint'),
    require('chiddy.plugins.lsp.jdtls'),
}
