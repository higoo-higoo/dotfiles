require("jaq-nvim").setup({
	cmds = {
		-- Uses vim commands
		internal = {
			lua = "luafile %",
			vim = "source %",
		},
		-- Uses shell commands
		external = {
			sh = "zsh %",
			tex = "latexmk -pvc $filePath -outdir=$fileBase",
		},
	},

	behavior = {
		-- Default type
		default = "terminal",

		-- Start in insert mode
		startinsert = false,

		-- Use `wincmd p` on startup
		wincmd = false,

		-- Auto-save files
		autosave = false,
	},

	ui = {
		float = {
			-- See ':h nvim_open_win'
			border = "none",

			-- See ':h winhl'
			winhl = "Normal",
			borderhl = "FloatBorder",

			-- See ':h winblend'
			winblend = 0,

			-- Num from `0-1` for measurements
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,
		},

		terminal = {
			-- Window position
			position = "right",

			-- Window size
			size = 10,

			-- Disable line numbers
			line_no = true,
		},

		quickfix = {
			-- Window position
			position = "bot",

			-- Window size
			size = 10,
		},
	},
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<Leader>run", "<Cmd>:Jaq<CR>", opts)
