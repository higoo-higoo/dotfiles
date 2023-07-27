local opts = {noremap = true, silent = false}
local team_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap


-- On Attach
local function my_on_attach(bufnr)
	local api = require('nvim-tree.api')
	local keymap = vim.keymap.set

	local function opts_attach(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	keymap('n', 'l', api.node.open.edit, opts_attach('CD'))
	keymap('n', 'h', api.node.navigate.parent_close, opts_attach('Close Directory'))
	keymap('n', 'D', api.fs.trash, opts_attach('Trash'))
	keymap('n', 'N', api.fs.create, opts_attach('Create'))
	keymap('n', 'C', api.fs.copy.node, opts_attach('Copy'))
	keymap('n', 'P', api.fs.paste, opts_attach('Paste'))
	keymap('n', 'R', api.fs.rename, opts_attach('Rename'))
end

-- SetUp
require("nvim-tree").setup {
sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = my_on_attach
}

-- Open Tree
keymap('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', opts) 
