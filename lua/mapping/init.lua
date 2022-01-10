vim.api.nvim_set_keymap('n', '<C-c>', ':NvimTreeToggle<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<space>fg', [[<cmd>Telescope live_grep<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>ff',  [[<cmd>Telescope find_files<cr>]], { noremap = true, silent = true })

vim.cmd[[
    imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
    smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

    imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
    smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]]