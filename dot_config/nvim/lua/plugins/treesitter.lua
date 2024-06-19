require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "typescript",
    "yaml",
  },

  sync_install = true,

  auto_install = true,

  highlight = {
    enable = true,
  },
})
