if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'moll/vim-bbye'
    Plug 'tpope/vim-commentary'

    Plug 'morhetz/gruvbox'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-lualine/lualine.nvim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'L3MON4D3/LuaSnip'

    Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
    " Plug 'rust-lang/rust.vim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-vinegar'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'

call plug#end()

