vim.cmd [[packadd packer.nvim]]

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.signcolumn = number
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.cmdheight = 2

vim.opt.clipboard = unnamedplus
vim.cmd 'colorscheme dracula'

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Dracula theme
    use {'dracula/vim', as = 'dracula'}

    -- Tree sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    
    -- Coc nvim Intellisense
    use { 'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile'}

    -- Chadtree
    use { 'ms-jpq/chadtree', run = 'python3 -m chadtree deps', branch = 'chad'}

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Autopairs
    use { 'windwp/nvim-autopairs', {'windwp/nvim-ts-autotag'} }

    -- Formatters
    use {'mhartington/formatter.nvim'}

end)

require('init')