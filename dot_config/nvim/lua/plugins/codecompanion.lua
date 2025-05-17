require("codecompanion").setup({
	opts = {
		log_level = "DEBUG",
	},
})
vim.keymap.set("n", "<Leader>cc", "<cmd>CodeCompanionChat<CR>")

