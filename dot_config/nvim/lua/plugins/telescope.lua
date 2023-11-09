-- SetUp
local builtin = require('telescope.builtin')
-- Search
vim.keymap.set("n","<Leader>fd", builtin.find_files, {})
vim.keymap.set("n","<Leader>ff", "<Cmd>Telescope frecency<CR>", {})
vim.keymap.set('n', '<Leader>fgr', builtin.live_grep,{})
