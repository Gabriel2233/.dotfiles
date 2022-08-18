vim.cmd('packadd packer.nvim')

require'packer'.startup(function()
	use 'wbthomason/packer.nvim'

	use 'moll/vim-bbye'
	use 'tpope/vim-commentary'

	use 'kyazdani42/nvim-web-devicons'
	use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'
    use 'tjdevries/express_line.nvim'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
    use 'sbdchd/neoformat'

	use { 'darrikonn/vim-gofmt', run = ':GoUpdateBinaries' }

	use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-vinegar'

	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'ThePrimeagen/harpoon'

    use 'onsails/lspkind-nvim'
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
