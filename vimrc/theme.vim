" Theme

" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
	set termguicolors
endif

colorscheme challenger_deep
hi Comment cterm=italic

highlight Comment cterm=italic gui=italic

