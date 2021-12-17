call plug#begin('~/.vim/plugged')

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim' 
Plug 'nathom/filetype.nvim' 
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lewis6991/impatient.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'ishan9299/nvim-solarized-lua'

call plug#end()

filetype plugin indent on
syntax on

set autoindent
set smartindent
set hidden
set shortmess+=c
set nowrap
set noswapfile
set noundofile
set nowritebackup
set nobackup
set number
set relativenumber
set ruler
set showcmd
set history=50
set clipboard=unnamed
set cmdheight=2
set showmatch
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set termguicolors
set background=dark
set updatetime=300
set signcolumn=number
set splitbelow
set splitright

colorscheme solarized

nnoremap <C-c> <cmd>CHADopen<cr>
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

lua << EOF

vim.g.did_load_filetypes = 1

require('impatient')

require'colorizer'.setup()

require('init')

EOF
