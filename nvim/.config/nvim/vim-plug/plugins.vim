if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'moll/vim-bbye'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'mattn/emmet-vim'

    Plug 'morhetz/gruvbox'

    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
    Plug 'rust-lang/rust.vim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

    Plug 'sbdchd/neoformat'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

call plug#end()

