" vim: set ts=2 sw=2 tw=80 noet :
" Theme
" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
	set termguicolors
endif

colorscheme challenger_deep
" colorscheme cyberpunk-neon
hi Comment cterm=italic

highlight Comment cterm=italic gui=italic
