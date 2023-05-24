local cmd = vim.cmd
local win = {}

function win.resize(horizontal, margin)
    local cur_win = vim.api.nvim_get_current_win()
    cmd(string.format('wincmd %s', horizontal and 'l' or 'j'))
    local new_win = vim.api.nvim_get_current_win()

    local not_last = cur_win ~= new_win
    local sign = margin < 0
    if not_last == true then
        cmd([[wincmd p]])
    else
        sign = not sign
    end

    sign = sign and '+' or '-'
    local dir = horizontal and 'vertical ' or ''
    local _cmd = dir .. 'resize ' .. sign .. math.abs(margin) .. '<CR>'
    cmd(_cmd)
end

return win
