---@class LazyPlugin
local M = {
    'smjonas/inc-rename.nvim',
    event = 'BufReadPost',
    cmd = 'IncRename',
}

function M.config()
    require('inc_rename').setup({
        -- input_buffer_type = 'dressing',
        preview_empty_name = true,
    })
    -- vim.lsp.buf.rename = function()
    --     vim.api.nvim_feedkeys(':IncRename ', 'n', false)
    -- end
end

return M
