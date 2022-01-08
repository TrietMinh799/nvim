vim.api.nvim_set_keymap('n', '<C-c>', ':NvimTreeToggle<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<space>fg', [[<cmd>Telescope live_grep<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>ff',  [[<cmd>Telescope find_files<cr>]], { noremap = true, silent = true })
