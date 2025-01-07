local web_formatter = { "biome", args = { "check", "--apply", "--stdin-file-path", "$FILENAME" } }
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		tex = { "latexindent" },
		cpp = { "clang-format" },
		sh = { "shfmt" },
		javascript = web_formatter,
		typescript = web_formatter,
		javascriptreact = web_formatter,
		typescriptreact = web_formatter,
	},
})

vim.keymap.set("", "<leader>fmt", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)
