-- Appearance
vim.opt.termguicolors = true -- True Color
vim.opt.title = true -- Show Title
vim.opt.number = true -- Show Line Number
vim.opt.relativenumber = true -- Show Line Relative Number
vim.opt.wrap = true -- Line Return
vim.opt.showmatch = true -- Show Matching Brackets
vim.opt.pumblend = 30
-- Search
vim.opt.hlsearch = true -- Highlight Word in Search

-- Indent
vim.opt.smartindent = true -- Auto Indent
vim.opt.tabstop = 2 -- 2 Spaces Treated as Tab
vim.opt.softtabstop = 2 -- <Tab> Make 2 Spaces
vim.opt.shiftwidth = 2 -- <Enter>, << , >> Make 2 Spaces
vim.opt.expandtab = true -- Use Space Instead of Tab

-- Complement
vim.opt.wildmode = "list:longest" -- Command Line Complement
vim.opt.infercase = true -- Case Insensitive

-- Copy
vim.opt.clipboard:append({ "unnamedplus" })

-- Log
vim.opt.history = 5000 -- Save 5000 Command Log
vim.opt.swapfile = false -- Don't Save Swap File
vim.opt.undofile = false -- Don't Save Undo File
vim.opt.backup = false -- Don't Save Back Up

-- Others
vim.cmd([[ filetype plugin indent on ]])
vim.g.tex_flavor = "latex"
vim.cmd([[set path+=/use/local/bin]])
