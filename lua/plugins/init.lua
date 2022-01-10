vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Themes
  use {'tomasiser/vim-code-dark', as = 'codedark'}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {
    "ray-x/lsp_signature.nvim",
  }

  -- Utilities
  use { "jose-elias-alvarez/nvim-lsp-ts-utils" }

  -- Completion
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }

  -- SNIPPET
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Tree explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- Auto pairs
  use {'windwp/nvim-autopairs'}
  use {'windwp/nvim-ts-autotag'}

  -- Statusline
  use {'feline-nvim/feline.nvim'}

end)
