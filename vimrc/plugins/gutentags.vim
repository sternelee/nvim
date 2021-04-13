" " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" " 所生成的数据文件的名称
" let g:gutentags_ctags_tagfile = '.tags'

" " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags

" " 配置 ctags 的参数
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" " 检测 ~/.cache/tags 不存在就新建
" if !isdirectory(s:vim_tags)
"    silent! call mkdir(s:vim_tags, 'p')
" endif

" " gutentags 需要靠上面定义的 project_root 里的标志，判断文件所在的工程，如果一个文件没有托管在 .git/.svn 中，gutentags 找不到工程目录的话，就不会为该野文件生成 tags，这也很合理。想要避免的话，你可以在你的野文件目录中放一个名字为 .root 的空白文件，主动告诉 gutentags 这里就是工程目录
" " gutentags_plus 配置
" " enable gtags module
" let g:gutentags_modules = ['ctags', 'gtags_cscope']

" " config project root markers.
" let g:gutentags_project_root = ['.root']

" " generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')

" " change focus to quickfix window after search (optional).
" let g:gutentags_plus_switch = 1
