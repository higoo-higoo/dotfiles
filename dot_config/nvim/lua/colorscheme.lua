vim.cmd([[
try
	colorscheme gruvbox
	highlight Normal ctermbg=NONE guibg=NONE
	highlight NonText ctermbg=NONE guibg=NONE
	highlight LineNr ctermbg=NONE guibg=NONE
	highlight Folded ctermbg=NONE guibg=NONE
	syntax enable
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme default
	set background=dark
endtry
]])
