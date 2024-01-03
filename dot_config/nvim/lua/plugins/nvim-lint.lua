require("lint").linters_by_ft = {
	markdown = { "vale" },
	tex = { "vale" },
	sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
