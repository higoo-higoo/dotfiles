vim.g.copilot_no_tab_map = true

local keymap = vim.keymap.set
-- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {markdown = true, text = true, yaml = true}
keymap("i", "<C-s>", 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true, replace_keycodes = false })
keymap("i", "<C-j>", "<Plug>(copilot-next)")
keymap("i", "<C-k>", "<Plug>(copilot-previous)")
keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")
-- keymap("i", "<C-s>", "<Plug>(copilot-suggest)")
