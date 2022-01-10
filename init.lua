vim.cmd [[colorscheme codedark]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'

vim.cmd[[
let g:coq_settings = { 'auto_start': v:true }
]]

require('init')
