local icons = require('chiddy.utils.icons')
local icontable = {
    ['Error'] = icons.diagnostics.Error,
    ['Warn'] = icons.diagnostics.Warning,
    ['Info'] = icons.diagnostics.Information,
    ['Hint'] = icons.diagnostics.Hint,
}

vim.diagnostic.config({
    signs = true,
    underline = true,
    virtual_text = {
        source = false,
        spacing = 15,
        prefix = '',
        format = function(diag)
            local ret = ''
            if diag.source ~= nil then
                ret = ret .. string.format('(%s)', diag.source:sub(1, -1))
            end
            if diag.message ~= nil then
                ret = ret .. string.format('%s', diag.message)
            end
            return ret
        end,
    }, -- {prefix = '<'}
    virtual_lines = false, -- lines support
    float = { scope = 'line', border = 'rounded', focusable = false, stlye = 'minimal' },
    severity_sort = true,
    update_in_insert = false,
})

-- vim.fn.sign_define(
--     'DiagnosticSignError',
--     { text = icontable[vim.diagnostic.severity.ERROR], texthl = 'DiagnosticSignError' }
-- )

for k, v in pairs(icontable) do
    vim.fn.sign_define('DiagnosticSign' .. k, { text = v, texthl = 'DiagnosticSign' .. k })
end
vim.fn.sign_define('LightBulbSign', { text = icons.diagnostics.Hint_alt, texthl = 'MatchParen' })

-- vim.cmd(
--     'sign define DiagnosticSignError text='
--         .. icontable[vim.diagnostic.severity.ERROR]
--         .. ' texthl=DiagnosticSignError linehl= numhl='
-- )
-- vim.cmd(
--     'sign define DiagnosticSignWarn text='
--         .. icontable[vim.diagnostic.severity.WARN]
--         .. ' texthl=DiagnosticSignWarn linehl= numhl='
-- )
-- vim.cmd(
--     'sign define DiagnosticSignInfo text='
--         .. icontable[vim.diagnostic.severity.INFO]
--         .. ' texthl=DiagnosticSignInfo linehl= numhl='
-- )
-- vim.cmd(
--     'sign define DiagnosticSignHint text='
--         .. icontable[vim.diagnostic.severity.HINT]
--         .. ' texthl=DiagnosticSignHint linehl= numhl='
-- )
