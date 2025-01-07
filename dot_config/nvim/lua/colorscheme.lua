vim.cmd([[
try
  colorscheme dracula
  " colorscheme gruvbox
  hi NvimTreeNormal guibg=NONE ctermbg=NONE
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
