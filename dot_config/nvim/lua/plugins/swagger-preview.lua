require("swagger-preview").setup({
  port = 8003,
  host = "localhost",
})

vim.keymap.set("n", "<Leader>gp", "<Cmd>SwaggerPreviewToggle<CR>", {})

