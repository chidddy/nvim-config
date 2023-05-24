-- json
local M = {}
M.config = {
    settings = {
        json = {
            format = {
                enable = true,
            },
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    },
}

return M
