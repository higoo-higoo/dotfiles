local opts = { noremap = true, silent = true }
local team_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- leaderを,に変更
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 入力モード中に素早くjjと入力した場合はESCとみなす
keymap("i", "jj", "<Esc>", opts)

-- ESCを2回押すことでハイライトを削除
keymap("n", "<Esc><Esc>", ":nohlsearch<CR>", opts)

-- Window操作
keymap("n", "<Leader>v", ":vs<CR>", opts)
keymap("n", "<Leader>s", ":sp<CR>", opts)
keymap("n", "<Leader>h", "<C-w>h", opts)
keymap("n", "<Leader>j", "<C-w>j", opts)
keymap("n", "<Leader>k", "<C-w>k", opts)
keymap("n", "<Leader>l", "<C-w>l", opts)

-- Tab navigation keymaps
vim.keymap.set("n", "<Leader>tn", "<Cmd>tabnext<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<Leader>tp", "<Cmd>tabprevious<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<Leader>tc", "<Cmd>tabnew<CR>", { desc = "Open new tab" })
