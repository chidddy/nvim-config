-- local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local devicons = require('nvim-web-devicons')
local icons = require('chiddy.utils.icons')

---@type StatusLine
local icon = {
    condition = function(self)
        return select(2, devicons.get_icon(self.filename, self.extension, { default = true })) ~= 'DevIconDefault'
    end,
    init = function(self)
        self.icon, self.icon_color = devicons.get_icon_color(self.filename, self.extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (self.icon .. ' ')
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end,
}

---@type StatusLine
local name = {
    init = function(self)
        self._filename = vim.fn.fnamemodify(self.filename, ':t')
        if self._filename == '' then
            self._filename = '[nn loser]'
        end
    end,
    {
        provider = function(self)
            return self._filename
        end,
    },
}

---@type StatusLine
local flags = {
    {
        condition = function()
            return vim.bo.modifiable and not vim.bo.readonly
        end,
        provider = ' ' .. icons.ui.Pencil,
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = ' ' .. icons.ui.Lock,
    },
}

---@type StatusLine
local modified = {
    hl = function()
        if vim.bo.modified then
            return { fg = 'cyan', bold = true, force = true }
        else
            return { fg = 'blue', bold = false, force = true }
        end
    end,
}

---@type StatusLine
local type = {
    provider = function()
        -- return string.lower(vim.bo.filetype)
        return vim.bo.filetype
    end,
    hl = function()
        local hl = select(2, devicons.get_icon_by_filetype(vim.bo.filetype))
        return (hl ~= nil and { fg = utils.get_highlight(hl).fg }) or {}
    end,
    -- hl = { fg = select(2, devicons.get_icon_by_filetype(vim.bo.filetype)), bold = true, force = true },
}

---@type StatusLine
local encoding = {
    provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
        return enc ~= 'utf-8' and enc:upper()
    end,
}

---@type StatusLine
local format = {
    provider = function()
        local fmt = vim.bo.fileformat
        return fmt ~= 'unix' and fmt:upper()
    end,
}

---@type StatusLine
local size = {
    provider = function(self)
        local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
        -- local index = 1
        local fsize = vim.fn.getfsize(self.filename)
        fsize = (fsize < 0 and 0) or fsize
        -- if fsize > 1024 and index < 7 then
        if fsize < 1024 then
            return fsize .. suffix[1]
            -- fsize = fsize / 1024
            -- index = index + 1
        end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.format('%.2g%s', fsize / math.pow(1024, i), suffix[i + 1])
        -- return string.format(index == 1 and '%g%s' or '%.2f%s', fsize, suffix[index])
    end,
}

---@type StatusLine
local last_mod = {
    provider = function()
        local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
        return (ftime > 0) and os.date('%c', ftime)
    end,
}

---@type StatusLine
local folder = {
    hl = { fg = 'blue', bold = true },
    {
        provider = function()
            return icons.ui.Folder .. ' ' .. vim.fn.expand('%:h:t')
        end,
    },
}

---@type StatusLine
local cwd = {
    hl = { fg = 'blue', bold = true },
    {
        provider = function()
            return icons.git.Repo .. ' ' .. vim.fn.fnamemodify(vim.loop.cwd(), ':t')
        end,
    },
}

return {
    filename = utils.insert(utils.insert(modified, name, unpack(flags)), { provider = '%<' }),
    fileicon = icon,
    filetype = type,
    fileencoding = encoding,
    fileformat = format,
    filesize = size,
    filemod = last_mod,
    folder = folder,
    cwd = cwd,
}
