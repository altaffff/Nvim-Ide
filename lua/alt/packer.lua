 -- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

         -- Telescope

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

             -- TreeSitter
    use ('nvim-treesitter/nvim-treesitter',
    {run = ':TSUpdate'})

	   -- NerdTree

    use ('preservim/nerdtree')

        --UndoTree Very Useful For Keeping File Backups 
    use ('mbbill/undotree')
        -- Icons for NerdTree
    use ('ryanoasis/vim-devicons')
        -- Comment Multiple Lines
    use ('tpope/vim-commentary')

        -- NerdTree Stuff
    use ('PhilRunninger/nerdtree-buffer-ops')
                --LSP Support 
    use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
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

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
-- Make sure to install relavent Language Servers Like Am using c++/c# So
--clang is installed


    -- Get Nice UI During Autocompletion 
  
    use {'stevearc/dressing.nvim'}


    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use{'nvim-telescope/telescope-live-grep-args.nvim'}

	use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
		} 
		
       --Lualine
	use {
    'nvim-lualine/lualine.nvim',
	requires
    = { 'nvim-tree/nvim-web-devicons',
	opt = true }
	}
	
	--Xams make it rain(Cosmatics)
		use {
  "folke/drop.nvim",
  event = "VimEnter",
  config = function()
    math.randomseed(os.time())
    local theme = ({ "stars", "snow", "xmas" })[math.random(1, 3)]
    require("drop").setup { theme = theme }
  end,
			}
      -- c++ stuff
    use('rhysd/vim-clang-format')

     --Theme
    use "ellisonleao/gruvbox.nvim"

     end)
