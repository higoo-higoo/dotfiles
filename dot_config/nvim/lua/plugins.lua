local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- File Explorer
	use {
	'ibhagwan/fzf-lua',
	config = function()
		require('plugins.fzf-lua')
	end
	}	use {
		"kyazdani42/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
		require("plugins.nvim-tree")
	end
	}

	-- Git
	use { 'tpope/vim-fugitive' }
	use { 'airblade/vim-gitgutter' }

	-- Appearence
	use { 'morhetz/gruvbox' }
	use {
		'akinsho/bufferline.nvim',
		tag = "*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("plugins.bufferline")
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require("plugins.lualine")
		end
	}
	--[[
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function ()
			require("plugins.nvim-treesitter")
		end}
	--]]
	-- Coding
	use 'jiangmiao/auto-pairs'
	use {
		"is0n/jaq-nvim",
		config = function ()
			require("plugins.jaq-nvim")
		end
	}

	use {
		"github/copilot.vim",
		config = function ()
			require("plugins.copilot")
		end
	}
	-- use "tpope/vim-surround"
	use {
		"vim-scripts/DoxygenToolkit.vim",
		config = function ()
			vim.keymap.set('n', '<Leader>dox', '<Cmd>Dox<CR>', {})
		end
	}
	use {
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end
	}

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-cmdline"
	use {
		"dcampos/nvim-snippy",
		config = function ()
			require("plugins.nvim-snippy")
		end
	}
	use "dcampos/cmp-snippy"
end)
require("plugins.lspconfig")

