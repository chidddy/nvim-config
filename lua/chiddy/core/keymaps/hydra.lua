local Hydra = require('hydra')

Hydra({
    name = 'Windows',
    mode = 'n',
    body = '<c-w>',
    config = {
        timeout = true,
    },
    heads = {
        { 'h', '<C-W>h' },
        { 'j', '<C-W>j' },
        { 'k', '<C-W>k' },
        { 'l', '<C-W>l' },

        { 'v', '<C-W>v' },
        { 'h', '<C-W>s' },

        {
            '<up>',
            function()
                require('chiddy.utils.win').resize(false, 2)
            end,
            { desc = 'resize: up' },
        },
        {
            '<down>',
            function()
                require('chiddy.utils.win').resize(false, -2)
            end,
            { desc = 'resize: down' },
        },
        {
            '<left>',
            function()
                require('chiddy.utils.win').resize(true, 2)
            end,
            { desc = 'resize: left' },
        },
        {
            '<right>',
            function()
                require('chiddy.utils.win').resize(true, -2)
            end,
            { desc = 'resize: right' },
        },
    },
})
