local opts = {noremap = true, silent = true}
local team_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

-- SetUp
local action = require "fzf-lua.actions"
require('fzf-lua').setup {
}
-- Search
keymap("n","<Leader>fd", "<cmd>lua require('fzf-lua').files()<CR>", opts)
keymap('n', '<Leader>fgr', "<cmd>lua require('fzf-lua').grep()<CR>",opts)

