local comp = vim.tbl_extend(
    'keep',
    require('chiddy.themes.status.components.general'),
    require('chiddy.themes.status.components.vimode'),
    require('chiddy.themes.status.components.files'),
    require('chiddy.themes.status.components.lsp'),
    require('chiddy.themes.status.components.cursor'),
    -- require('chiddy.themes.status.components.dap'),
    require('chiddy.themes.status.components.git'),
    require('chiddy.themes.status.components.sep')
)

return comp
