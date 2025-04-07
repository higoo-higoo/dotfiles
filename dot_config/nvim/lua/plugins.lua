local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- use({ "morhetz/gruvbox" })
	-- use({
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		require("plugins.kanagawa")
	-- 	end,
	-- })
	use({
		"Mofiqul/dracula.nvim",
		config = function()
			require("plugins.dracula")
		end,
	})
	-- use({
	-- 	"navarasu/onedark.nvim",
	-- 	config = function()
	-- 		require("plugins.onedark")
	-- 	end,
	-- })
	-- use({
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	-- 	config = function()
	-- 		require("plugins.catppuccin")
	-- 	end,
	-- })
	-- use({
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("plugins.tokyonight")
	-- 	end,
	-- })
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

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use({
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup()
		end,
	})
	-- File Explorer
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.telescope")
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
	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.gitlinker")
		end,
	})
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

	-- Coding
	use("jiangmiao/auto-pairs")

  use({
    "hat0uma/csvview.nvim",
    config = function()
      require("csvview").setup()
    end,
  })
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	-- use({
	-- 	"dccsillag/magma-nvim",
	-- 	run = ":UpdateRemotePlugins",
	-- 	config = function()
	-- 		require("plugins.magma-nvim")
	-- 	end,
	-- })
	-- use({
	-- 	"GCBallesteros/jupytext.nvim",
	-- 	-- packer では lazy.nvim のように lazy = false というオプションはないので
	-- 	-- 必ず読み込む場合は特に何も書かないか、"event", "cmd", "ft", "setup" などを省略します。
	-- 	config = function()
	-- 		-- プラグインのデフォルト設定を上書きしたい場合に書く
	-- 		require("jupytext").setup({})
	-- 	end,
	-- 	-- ファイルタイプが ipynb のときだけ読み込ませたい場合は以下のように書く
	-- 	-- ft = { "ipynb" },
	-- })
	--
	-- ------------------------------------------------------------
	-- -- 2) NotebookNavigator.nvim & molten + image.nvim
	-- ------------------------------------------------------------
	-- use({
	-- 	"GCBallesteros/NotebookNavigator.nvim",
	-- 	event = "VimEnter",
	-- 	-- NotebookNavigator.nvim の設定
	-- 	config = function()
	-- 		-- プラグインのセットアップ
	-- 		local nn = require("notebook-navigator")
	-- 		nn.setup({
	-- 			activate_hydra_keys = "<leader>y",
	-- 			repl_provider = "molten",
	-- 		})
	--
	-- 		-- lazy.nvim での keys 設定は packer にはないので、自分でキー設定
	-- 		-- 例: vim.keymap.set("n", "]h", ...)
	-- 		vim.keymap.set("n", "]h", function()
	-- 			require("notebook-navigator").move_cell("d")
	-- 		end)
	--
	-- 		vim.keymap.set("n", "[h", function()
	-- 			require("notebook-navigator").move_cell("u")
	-- 		end)
	--
	-- 		vim.keymap.set("n", "<leader>rc", function()
	-- 			require("notebook-navigator").run_cell()
	-- 		end)
	--
	-- 		vim.keymap.set("n", "<leader>rm", function()
	-- 			require("notebook-navigator").run_and_move()
	-- 		end)
	-- 	end,
	-- 	requires = {
	-- 		"echasnovski/mini.comment",
	-- 		"anuvyklack/hydra.nvim",
	--
	-- 		----------------------------------------------------------------
	-- 		-- molten + image.nvim
	-- 		----------------------------------------------------------------
	-- 		{
	-- 			"benlubas/molten-nvim",
	-- 			-- packer でバージョン固定をする場合は tag または branch を使うことが多いです
	-- 			-- ただし npm パッケージ等のように semver がネイティブに扱われているわけではないので注意
	-- 			-- "version = '^1.0.0'" は lazy.nvim での書き方
	-- 			-- packer 側では "tag = 'v1.0.0'" などで近いことはできます
	-- 			-- ここでは例として最初に見つかったタグを指定しておきます
	-- 			tag = "v1.9.2",
	-- 			run = ":UpdateRemotePlugins", -- molten が要求しているコマンド
	-- 			setup = function()
	-- 				-- plugin 読み込み前に実行される (lazy.nvim の init に相当)
	-- 				vim.g.molten_image_provider = "image.nvim"
	-- 				vim.g.molten_output_win_max_height = 500
	-- 			end,
	-- 			requires = {
	-- 				{
	-- 					"3rd/image.nvim",
	-- 					config = function()
	-- 						-- plugin 読み込み後に実行される
	-- 						require("image").setup({
	-- 							backend = "kitty",
	-- 							max_width = 500,
	-- 							max_height = 500,
	-- 							max_height_window_percentage = math.huge,
	-- 							max_width_window_percentage = math.huge,
	-- 							window_overlap_clear_enabled = true,
	-- 							window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	-- 						})
	-- 					end,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- })
	--
	use("ray-x/go.nvim")
	use({
		"nvim-flutter/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			require("plugins.flutter-tools")
		end,
	})
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
		tag = "v7.1.0",
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
	use({
		"vinnymeller/swagger-preview.nvim",
		run = "npm install -g swagger-ui-watcher",
		config = function()
			require("plugins.swagger-preview")
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
