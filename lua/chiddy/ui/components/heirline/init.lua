local comp = vim.tbl_extend(
    'keep',
    require('chiddy.ui.components.heirline.general'),
    require('chiddy.ui.components.heirline.vimode'),
    require('chiddy.ui.components.heirline.files'),
    require('chiddy.ui.components.heirline.lsp'),
    require('chiddy.ui.components.heirline.cursor'),
    -- require('chiddy.ui.components.heirline.dap'),
    require('chiddy.ui.components.heirline.git'),
    require('chiddy.ui.components.heirline.sep')
)

return comp
