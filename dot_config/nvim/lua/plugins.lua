local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- File Explorer
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.telescope")
		end,
	})
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.nvim-tree")
		end,
	})

	-- Git
	use({ "tpope/vim-fugitive" })
	use({ "airblade/vim-gitgutter" })
	-- nvim v0.7.2
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("plugins.lazygit")
		end,
	})

	-- Appearence
	use({ "morhetz/gruvbox" })
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.bufferline")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.lualine")
		end,
	})
	use({
		"simeji/winresizer",
		config = function()
			vim.keymap.set("n", "<Leader>w", "<Cmd>WinResizerStartResize<CR>", {})
		end,
	})

	-- Coding
	use("jiangmiao/auto-pairs")
	use({
		"is0n/jaq-nvim",
		config = function()
			require("plugins.jaq-nvim")
		end,
	})
	use({
		"github/copilot.vim",
		config = function()
			require("plugins.copilot")
		end,
	})
	use({
		"vim-scripts/DoxygenToolkit.vim",
		config = function()
			vim.keymap.set("n", "<Leader>dox", "<Cmd>Dox<CR>", {})
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"stevearc/conform.nvim",
		config = function()
			require("plugins.conform")
		end,
	})
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			require("plugins.markdown-preview")
		end,
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use({
		"dcampos/nvim-snippy",
		config = function()
			require("plugins.nvim-snippy")
		end,
	})
	use("dcampos/cmp-snippy")
end)
require("plugins.lspconfig")
