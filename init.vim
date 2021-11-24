call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'
Plug 'yashguptaz/calvera-dark.nvim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nathom/filetype.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tami5/lspsaga.nvim', {'branch': 'nvim51'}
Plug 'lewis6991/impatient.nvim'

call plug#end()

filetype plugin indent on
syntax on

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

colorscheme calvera

nnoremap <C-c> <cmd>CHADopen<cr>
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>

nnoremap <silent><TAB> :Lspsaga hover_doc<CR>
nnoremap <silent><space>ca :Lspsaga code_action<CR>
vnoremap <silent><space>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>rn :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> <space>cd :Lspsaga show_line_diagnostics<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Expand or jump
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

let g:calvera_italic_comments = 1
let g:calvera_italic_keywords = 1
let g:calvera_italic_functions = 1
let g:calvera_contrast = 1

lua << EOF

vim.g.did_load_filetypes = 1

require('impatient')

require'colorizer'.setup()

require('init')

EOF
