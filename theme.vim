" vim: set ts=2 sw=2 tw=80 noet :
" Theme
" Enable 256 color terminal
set t_Co=256

highlight ColorColumn ctermbg=125

" Enable true color
if has('termguicolors')
	set termguicolors
endif

colorscheme nightfly
" colorscheme challenger_deep cyberpunk
" hi Comment cterm=italic

" highlight Comment cterm=italic gui=italic
