---@class LazyPlugin
local plugin = {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter', 'CmdLineEnter' },
}

function plugin.config()
    local rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')
    local pairs = require('nvim-autopairs')
    pairs.setup({
        map_bs = true,
        map_c_h = false,
        map_c_w = false,
        map_cr = true,
        disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
        disable_in_macro = true,
        disable_in_visualblock = false,
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        break_undo = true,
        check_ts = true,
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
        enable_bracket_in_quote = true,
        enable_abbr = false,
        ts_config = {
            lua = { 'string', 'source' },
            javascript = { 'string', 'template_string' },
            java = false,
        },
        fast_wrap = {
            map = '<M-e>',
            chars = { '{', '[', '(', '"', "'", '<' },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
            offset = 0, -- Offset from pattern match
            end_key = '$',
            keys = 'qwertyuiopzxcvbnmasdfghjkl',
            check_comma = true,
            highlight = 'PmenuSel',
            highlight_grey = 'LineNr',
        },
    })
    pairs.add_rules({
        rule('<', '>'):with_pair(cond.before_regex('%a+')):with_move(function(opts)
            return opts.char == '>'
        end),
    })
end

return plugin
