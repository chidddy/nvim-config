local M = {}
M.config = {
    filetypes = {
        'yaml',
        'yml',
        'yaml.docker-compose',
    },
    settings = {
        yaml = {
            hover = true,
            completion = true,
            validate = true,
            schemaStore = {
                enable = true,
            },
        },
    },
}

return M
