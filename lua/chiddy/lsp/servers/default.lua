local U = require('chiddy.utils.lsp')
local M = {}
M.config = {
    autostart = true,
    flags = U.default_flags,
    capabilities = U.capabilities(),
    on_attach = U.default_on_attach,
}

return M
