local U = require('chiddy.utils.lsp')
require('jdtls').start_or_attach({
    cmd = { '/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    flags = U.default_flags,
    capabilities = U.capabilities(),
    on_attach = U.default_on_attach,
})
