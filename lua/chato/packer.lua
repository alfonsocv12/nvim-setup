-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	'olimorris/onedarkpro.nvim',
	as = "onedark",
	config = function()
		vim.cmd('colorscheme onedark')
	end
  })

  use('nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'})
  use('nvim-treesitter/playground')
  use('tpope/vim-commentary')
  use('mbbill/undotree')
  use('zbirenbaum/copilot.lua')
  use('tpope/vim-fugitive')
  use('natecraddock/workspaces.nvim')
  use('rosstang/lunajson.nvim')

  use {
    'nvimtools/none-ls.nvim',
    requires = {
        {'nvimtools/none-ls-extras.nvim'}
    }
  }

  use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v2.x',
  	requires = {
    		-- LSP Support
    		{'neovim/nvim-lspconfig'},             -- Required
    		{                                      -- Optional
      			'williamboman/mason.nvim',
      			run = function()
        			pcall(vim.cmd, 'MasonUpdate')
      			end,
    		},
    		{'williamboman/mason-lspconfig.nvim'}, -- Optional

    		-- Autocompletion
    		{'hrsh7th/nvim-cmp'},     -- Required
    		{'hrsh7th/cmp-nvim-lsp'}, -- Required
    		{'L3MON4D3/LuaSnip'},     -- Required
  	}
  }

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  }

end)
