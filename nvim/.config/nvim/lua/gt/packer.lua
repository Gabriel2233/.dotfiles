vim.cmd('packadd packer.nvim')

require'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'

 	use 'moll/vim-bbye'

 	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-vinegar'

	use 'morhetz/gruvbox'
    use 'tjdevries/express_line.nvim'

    use {
	    'VonHeikemen/lsp-zero.nvim',
	    requires = {
		    -- LSP Support
		    {'neovim/nvim-lspconfig'},
		    {'williamboman/mason.nvim'},
		    {'williamboman/mason-lspconfig.nvim'},

		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},
		    {'hrsh7th/cmp-buffer'},
		    {'hrsh7th/cmp-path'},
		    {'saadparwaiz1/cmp_luasnip'},
		    {'hrsh7th/cmp-nvim-lsp'},
		    {'hrsh7th/cmp-nvim-lua'},
	  }
    }

	use 'nvim-treesitter/nvim-treesitter'

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
