require("codecompanion").setup({
  opts = {
    log_level = "DEBUG",
  },
  strategies = {
    chat = {
      keymaps = {
        send = {
          modes = {
            n = "<CR>",
            i = "<C-l>"
          }
        }
      }
    }
  }
})
vim.keymap.set("n", "<Leader>cc", "<cmd>CodeCompanionChat<CR>")
