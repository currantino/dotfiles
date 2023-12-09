vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
                requires = { { 'nvim-lua/plenary.nvim'} }
        }

        use({
                'rose-pine/neovim',
                as = 'rose-pine',
                config = function()
                        vim.cmd('colorscheme rose-pine-moon')
                end
        })

        use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

        use('nvim-treesitter/playground')

        use('theprimeagen/harpoon')

        use('mbbill/undotree')

        use('tpope/vim-fugitive')

        use {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v2.x',
                requires = {
                        {'neovim/nvim-lspconfig'},
                        {'williamboman/mason.nvim'},
                        {'williamboman/mason-lspconfig.nvim'},

                        {'hrsh7th/nvim-cmp'},
                        {'hrsh7th/cmp-buffer'},
                        {'hrsh7th/cmp-path'},
                        {'hrsh7th/cmp-nvim-lsp'},
                        {'hrsh7th/cmp-nvim-lua'},
                        {'saadparwaiz1/cmp_luasnip'},

                        {'L3MON4D3/LuaSnip'},
                        {'rafamadriz/friendly-snippets'}
                }
        }

        use {
                'nvim-lualine/lualine.nvim',
                requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }

        use 'mfussenegger/nvim-jdtls'

        use 'm4xshen/autoclose.nvim'

        use 'windwp/nvim-ts-autotag'

        use 'prettier/vim-prettier'

        use 'lukas-reineke/lsp-format.nvim'

        use 'karb94/neoscroll.nvim'

        use 'HiPhish/nvim-ts-rainbow2'

        use 'sbdchd/neoformat'

        use 'tpope/vim-commentary'

end)
