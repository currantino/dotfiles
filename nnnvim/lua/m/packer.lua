vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use ('nvim-treesitter/playground')

	use ('theprimeagen/harpoon')

	use ('mbbill/undotree')

	use ('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
end)

local packer_group = vim.api.nvim_create_augroup('Packer', {clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'source <afile> | PackerCompile',
        group = packer_group,
        pattern = vim.fn.expand '$MYVIMRC',
})

