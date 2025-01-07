-- SetUp
local builtin = require("telescope.builtin")
-- Search
vim.keymap.set("n", "<Leader>fd", builtin.find_files, {})
vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope frecency<CR>", {})
vim.keymap.set("n", "<Leader>fgr", builtin.live_grep, {})
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
