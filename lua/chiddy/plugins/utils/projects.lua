---@class LazyPlugin
local M = {
    'ahmedkhalf/project.nvim',
}
function M.config()
    require('project_nvim').setup({
        manual_mode = true,
    })
end

return M
