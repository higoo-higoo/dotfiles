require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		tex = { "latexindent" },
		cpp = { "clang-format" },
		sh = { "shfmt" },
		javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },
	},
})

vim.keymap.set("", "<leader>fmt", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)
