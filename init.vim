call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'honza/vim-snippets'
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
Plug 'tomasiser/vim-code-dark'

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

colorscheme codedark

nnoremap <C-c> <cmd>CHADopen<cr>
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <C-j> <cmd>lua require'luasnip'.jump(-1)<Cr>


lua << EOF

vim.g.did_load_filetypes = 1

require('impatient')

require'colorizer'.setup()

require('init')

EOF

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
