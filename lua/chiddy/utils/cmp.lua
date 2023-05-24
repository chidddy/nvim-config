local str = require('cmp.utils.str')
local types = require('cmp.types')
local M = {}

function M.is_snippet()
    local session = require('luasnip.session')
    local node = session.current_nodes[vim.api.nvim_get_current_buf()]
    if not node then
        return false
    end
    local snippet = node.parent.snippet
    local begin_pos, end_pos = snippet.mark:pos_begin_end()
    local pos = vim.api.nvim_win_get_cursor(0)
    if pos[1] - 1 >= begin_pos[1] and pos[1] - 1 <= end_pos[1] then
        return true
    end
    return false
end

function M.rhs(rhs_str)
    return vim.api.nvim_replace_termcodes(rhs_str, true, true, true)
end

function M.column()
    local _line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col
end

function M.is_whitespace()
    local col = M.column()
    return col == 0 or vim.api.nvim_get_current():sub(col, col):match('%s')
end

function M.shift_width()
    if vim.o.softtabstop <= 0 then
        return vim.fn.shiftwidth()
    else
        return vim.o.softtabstop
    end
end

function M.has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

function M.check_backspace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function M.smart_bs()
    if vim.o.expandtab then
        return M.rhs(':<')
    else
        local col = M.column()
        local line = vim.api.nvim_get_current_line()
        local prefix = line:sub(1, col)
        local in_leading_indent = prefix:find('^%s*$')
        if in_leading_indent then
            return M.rhs(':<')
        end
        local previous_char = prefix:sub(#prefix, #prefix)
        if previous_char ~= ' ' then
            return M.rhs(':<')
        end
        return M.rhs('<C-\\><C-o>:set expandtab<CR><BS><C-\\><C-o>:set noexpandtab<CR>')
    end
end

function M.smart_tab()
    local keys = nil
    if vim.o.expandtab then
        keys = '<Tab>'
    else
        local col = M.column()
        local line = vim.api.nvim_get_current_line()
        local prefix = line:sub(1, col)
        local in_leading_indent = prefix:find('^%s*$')
        if in_leading_indent then
            keys = '<Tab>'
        else
            local sw = M.shift_width()
            local previous_char = prefix:sub(#prefix, #prefix)
            local previous_column = #prefix - #previous_char + 1
            local current_column = vim.fn.cirtcol({ vim.fn.line('.'), previous_column }) + 1
            local remainder = (current_column - 1) % sw
            local move = remainder == 0 and sw or sw - remainder
            keys = (' '):rep(move)
        end
    end
    vim.api.nvim_feedkeys(M.rhs(keys), 'nt', true)
end

function M.get_abbr(vim_item, entry)
    local word = entry:get_insert_text()
    if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
        word = vim.lsp.util.parse_snippet(word)
    end
    word = str.oneline(word)

    local max = 50
    if string.len(word) >= max then
        local before = string.sub(word, 1, math.floor((max - 3) / 2))
        word = before .. '...'
    end

    if
        entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
        and string.sub(vim_item.abbr, -1, -1) == '~'
    then
        word = word .. '~'
    end

    return word
end

return M
