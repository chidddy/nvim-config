stds.nvim = {
    read_globals = { 'vim' },
    globals = {
        'vim.g',
        'vim.b',
        'vim.w',
        'vim.o',
        'vim.bo',
        'vim.wo',
        'vim.go',
        'vim.env',
        'vim.opt',
        'vim.notify',
    },
}

cache = true

self = false

std = 'luajit+nvim'

only = {
    '221',
    '231',
    '232',
    '233',
    '241',
    '311',
    '312',
    '313',
    '314',
    '321',
    '331',
    '341',
    '511',
    '521',
    '531',
    '532',
    '541',
    '542',
    '551',
    '561',
    '571',
    '581',
    '582',
}
