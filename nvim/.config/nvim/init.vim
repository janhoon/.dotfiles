syntax on

set nocompatible
set nu rnu
set nohlsearch
set tabstop=4
set shiftwidth=4
set expandtab

let mapleader = " "

set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set wildignore+=**/vendor/*

set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Plugins
call plug#begin('~/.vim/plugged')

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cappyzawa/starlark.vim'
Plug 'towolf/vim-helm'
Plug 'pantharshit00/vim-prisma'

" DBs
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Git
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" pretty
Plug 'sbdchd/neoformat'

" theme
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" testing
Plug 'vim-test/vim-test'

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" replace everything
Plug 'windwp/nvim-spectre'

" other
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

set background=dark " or light if you want light mode
colorscheme gruvbox

lua require("smileyhoon")

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

