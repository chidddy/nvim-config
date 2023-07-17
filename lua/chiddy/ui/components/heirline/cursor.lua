---@type StatusLine
local percent = {
    provider = function()
        local curline = vim.fn.line('.')
        local endline = vim.fn.line('$')
        if curline == 1 then
            return 'top'
        elseif curline == endline then
            return 'bot'
        end
        return math.floor(curline / endline * 100) .. '%%'
    end,
}

---@type StatusLine
local position = {
    provider = function()
        return string.format('%3d:%-2d', vim.fn.line('.'), vim.fn.virtcol('.'))
    end,
}

---@type StatusLine
local scrollbar = {
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
        -- Another variant, because the more choice the better.
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' },
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = 'blue' },
}

---@type StatusLine
local search = {
    condition = function(self)
        local lines = vim.api.nvim_buf_line_count(0)
        if lines > 50000 then
            return
        end

        local query = vim.fn.getreg('/')
        if query == '' then
            return
        end
        if query:find('@') then
            return
        end

        local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
        local active = false
        if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
            active = true
        end
        if not active then
            return
        end

        query = query:gsub([[^\V]], '')
        query = query:gsub([[\<]], ''):gsub([[\>]], '')
        self.query = query
        self.count = search_count
        return true
    end,
    {
        provider = function(self)
            return table.concat({ ' ', self.query, ' ', self.count.current, '/', self.count.total, ' ' })
        end,
    },
    {
        provider = ' ',
    },
}

return {
    percent = percent,
    position = position,
    scrollbar = scrollbar,
    search = search,
}
