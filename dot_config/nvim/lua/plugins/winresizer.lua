local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>r', '<cmd>WinResizerStartResize<CR>', opts) 

