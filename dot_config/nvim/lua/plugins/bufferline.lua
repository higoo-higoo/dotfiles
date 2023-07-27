require("bufferline").setup{
	options = {
		globalstatus = true,
	}
}

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<Leader>x', '<Cmd>bwipeout<CR>', {})

