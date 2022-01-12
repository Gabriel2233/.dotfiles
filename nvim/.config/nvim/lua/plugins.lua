vim.cmd('packadd packer.nvim')

require'packer'.startup(function()
	use 'wbthomason/packer.nvim'

	use 'moll/vim-bbye'
	use 'tpope/vim-commentary'

	use 'morhetz/gruvbox'
	use 'tjdevries/express_line.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'tjdevries/colorbuddy.vim'
	use 'tjdevries/gruvbuddy.nvim'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'

	use { 'darrikonn/vim-gofmt', run = ':GoUpdateBinaries' }
	-- use 'rust-lang/rust.vim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'tpope/vim-fugitive'
	use 'tpope/vim-vinegar'

	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'ThePrimeagen/harpoon'
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
