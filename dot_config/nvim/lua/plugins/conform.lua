require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
		cpp = { "clang-format" },
  }
})

vim.keymap.set("", "<leader>fmt", function()
  require("conform").format({ async = true, lsp_fallback = true })
end)
