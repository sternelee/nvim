" 教程： https://segmentfault.com/a/1190000016186540
" Customize fzf colors to match your color scheme
" 安装fzf,ctags,bat
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', '#5f5f87'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
" let g:fzf_preview_window = ['bat --style=numbers --color=always --line-range :500 {}']
"let g:fzf_commits_log_options = '--graph --color=always
"  \ --format="%C(yellow)%h%C(red)%d%C(reset)
"  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

"" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

""let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
"" ripgrep
" if executable('rg')
"   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   set grepprg=rg\ --vimgrep
"   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" endif

"let $FZF_DEFAULT_OPTS='--layout=reverse'
"" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

"function! FloatingFZF()
"  let buf = nvim_create_buf(v:false, v:true)
"  call setbufvar(buf, 'number', 'no')

"  let height = float2nr(&lines/2)
"  let width = float2nr(&columns - (&columns * 2 / 10))
"  "let width = &columns
"  let row = float2nr(&lines / 3)
"  let col = float2nr((&columns - width) / 3)

"  let opts = {
"        \ 'relative': 'editor',
"        \ 'row': row,
"        \ 'col': col,
"        \ 'width': width,
"        \ 'height':height,
"        \ }
"  let win =  nvim_open_win(buf, v:true, opts)
"  call setwinvar(win, '&number', 0)
"  call setwinvar(win, '&relativenumber', 0)
"endfunction

"" Files + devicons
"function! Fzf_dev()
"  let l:fzf_files_options = ' --preview "rougify {2..-1} | head -'.&lines.'"'

"  function! s:files()
"    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
"    return s:prepend_icon(l:files)
"  endfunction

"  function! s:prepend_icon(candidates)
"    let l:result = []
"    for l:candidate in a:candidates
"      let l:filename = fnamemodify(l:candidate, ':p:t')
"      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
"      call add(l:result, printf('%s %s', l:icon, l:candidate))
"    endfor

"    return l:result
"  endfunction

"  function! s:edit_file(item)
"    let l:pos = stridx(a:item, ' ')
"    let l:file_path = a:item[pos+1:-1]
"    execute 'silent e' l:file_path
"  endfunction

"  call fzf#run({
"        \ 'source': <sid>files(),
"        \ 'sink':   function('s:edit_file'),
"        \ 'options': '-m ' . l:fzf_files_options,
"        \ 'down':    '40%' ,
"        \ 'window': 'call FloatingFZF()'})
"endfunction

"" nnoremap <Leader>f :Files<Cr>
"" nnoremap <Leader>B :Buffers<Cr>
" let g:rg_command = '
"   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"   \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
"   \ -g "!{.git,node_modules,vendor}/*" '

"command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"" floating window size ratio
" let g:fzf_preview_floating_window_rate = 0.9

"" fzf command default options
"let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }

"" Add fzf quit mapping
"let g:fzf_preview_quit_map = 1

"" jump to the buffers by default, when possible
"let g:fzf_preview_buffers_jump = 0

"" Commands used for fzf preview.
"" The file name selected by fzf becomes {}
"let g:fzf_preview_command = 'cat'                               " Not installed bat
"" let g:fzf_preview_command = 'bat --color=always --plain {-1}' " Installed bat

"" g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
"let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'

"" Commands used for binary file
"let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

"" Commands used to get the file list from project
"let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'               " Not Installed ripgrep
"" let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep

"" Commands used to get the file list from git reposiroty
"let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'

"" Commands used to get the file list from current directory
"let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'

"" Commands used to get the git status file list
"let g:fzf_preview_git_status_command = "git status --short --untracked-files=all | awk '{if (substr($0,2,1) !~ / /) print $2}'"

"" Commands used for git status preview.
"let g:fzf_preview_git_status_preview_command =  "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} || " .
"\ "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} || " .
"\ g:fzf_preview_command

"" Commands used for project grep
"let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'

"" MRU and MRW cache directory
"let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')

"" If this value is not 0, disable mru and mrw
"let g:fzf_preview_disable_mru = 0

"" Commands used for current file lines
"let g:fzf_preview_lines_command = 'bat --color=always --plain --number'

"" Commands used for preview of the grep result
"let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'

"" Cache directory for mru and mrw
"let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')

"" Keyboard shortcuts while fzf preview is active
"let g:fzf_preview_preview_key_bindings = ''
"" let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'

"" Specify the color of fzf
"let g:fzf_preview_fzf_color_option = ''

"" Set the processes when selecting an element with fzf
"let g:fzf_preview_custom_processes = {}
"" For example, set split to ctrl-s
"" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file')
"" on coc extensions
"" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file', 'coc')
"" let g:fzf_preview_custom_processes['open-file']['ctrl-s'] = g:fzf_preview_custom_processes['open-file']['ctrl-x']
"" call remove(g:fzf_preview_custom_processes['open-file'], 'ctrl-x')

"" Use as fzf preview-window option
"let g:fzf_preview_fzf_preview_window_option = ''
"" let g:fzf_preview_fzf_preview_window_option = 'up:30%'

"" Use vim-devicons
"let g:fzf_preview_use_dev_icons = 0

"" devicons character width
"let g:fzf_preview_dev_icon_prefix_string_length = 3

"" Devicons can make fzf-preview slow when the number of results is high
"" By default icons are disable when number of results is higher that 5000
"let g:fzf_preview_dev_icons_limit = 5000

"" The theme used in the bat preview
"" $FZF_PREVIEW_PREVIEW_BAT_THEME = 'ansi-dark'
"-----------------------------------------------------------------------------
" 全局配置
"-----------------------------------------------------------------------------
"if exists('g:loaded_config_fzf_vim_vim')
"    finish
"endif
"let g:loaded_config_fzf_vim_vim = 1

"" fzf文件夹
"" let g:fzf_dir = g:cache_root_path . '/fzf'
"" fzf history 文件
"" let g:fzf_history_dir = g:fzf_dir . "/fzf-history"

"" 输入框在顶部
"let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
"let $FZF_DEFAULT_COMMAND = "rg --files --hidden"

"" fzf外观
"" coc-fzf也使用这个变量
"let g:fzf_layout = {
"    \ 'window': {
"        \ 'up': '~90%', 'width': 0.6, 'height': 0.8, 'yoffset':0.5,
"        \ 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'
"    \ }
"\ }

"" 预览窗口配置
"let s:preview_window_config = 'up:50%:wrap'
"let s:preview_window = '--preview-window=' . s:preview_window_config
"let g:fzf_preview_window = s:preview_window_config
"" 自定义窗口预览程序
"" let s:preview_program = g:scripts_root_path . "/preview.sh"

"" 如果存在buffer，那么跳转过去
"let g:fzf_buffers_jump = 1

""-----------------------------------------------------------------------------
"" 主题配置
""-----------------------------------------------------------------------------
"" 配色与主题同色
"" fg表示未选中行的前景色
"" hl表示搜索到的文字的颜色
"" fg+表示选中的行的前景色
"" hl+表示选中的行的搜索文字颜色
"let g:fzf_colors = {
"    \ 'fg':      ['fg', 'Normal'],
"    \ 'bg':      ['bg', 'Normal'],
"    \ 'hl':      ['fg', 'Directory'],
"    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"    \ 'hl+':     ['fg', 'WarningMsg'],
"    \ 'info':    ['fg', 'PreProc'],
"    \ 'border':  ['fg', 'Ignore'],
"    \ 'prompt':  ['fg', 'Conditional'],
"    \ 'pointer': ['fg', 'Exception'],
"    \ 'marker':  ['fg', 'Keyword'],
"    \ 'spinner': ['fg', 'Label'],
"    \ 'header':  ['fg', 'Comment'] }

""-----------------------------------------------------------------------------
"" 使用ctrl jk上下移动选项
""-----------------------------------------------------------------------------
"augroup vime_fzf_group
"    autocmd!
"    au FileType fzf tnoremap <buffer> <C-j> <Down>
"    au FileType fzf tnoremap <buffer> <C-k> <Up>
"    au FileType fzf tnoremap <buffer> <Esc> <c-g>
"augroup END

""-----------------------------------------------------------------------------
"" 一些函数
""-----------------------------------------------------------------------------
"" ref https://github.com/junegunn/fzf.vim/issues/379
"" 使用系统应用打开文件
"function! s:SystemExecute(lines)
"    for line in a:lines
"        exec 'silent !xdg-open ' . fnameescape(line) . ' > /dev/null'
"    endfor
"endfunction

"function! s:DeleteBuffer(lines)
"    for l:line in a:lines
"        " exec 'bd ' . line
"    endfor
"endfunction

"let g:fzf_action = {
"    \ 'ctrl-t': 'tab split',
"    \ 'ctrl-x': 'split',
"    \ 'ctrl-v': 'vsplit',
"    \ 'alt-x': function('s:SystemExecute'),
"\ }

""-----------------------------------------------------------------------------
"" 内容检索
""-----------------------------------------------------------------------------
"function! s:RipgrepFzfWithWiki(query, fullscreen) abort
"    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s %s || true'

"    " 这个是在安装了vimwiki插件后使用的功能，需要配置一下g:vimwiki_path路径
"    if &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
"        let l:path = g:vimwiki_path
"    else
"        let l:path = ""
"    endif

"    let initial_command = printf(command_fmt, shellescape(a:query), l:path)
"    let reload_command = printf(command_fmt, '{q}', l:path)
"    let spec = {'options': [
"                \ '--phony',
"                \ '--query', a:query,
"                \ '--bind', 'change:reload:'.reload_command,
"                \ '--preview', s:preview_program . ' {}',
"                \ s:preview_window
"                \ ]}

"    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"endfunction

"" function! s:RipgrepFzfWithWikiVisual(fullscreen) abort range
""     call s:RipgrepFzfWithWiki(common#functions#getVisualSelection(), a:fullscreen)
"" endfunction
"" TODO 还需要优化，尽量合并成一个函数，通过参数来操作
"command! -nargs=* -bang GrepWithWiki call s:RipgrepFzfWithWiki(<q-args>, <bang>0)
"command! -range=% -bang  GrepWithWikiVisual <line1>,<line2>call s:RipgrepFzfWithWikiVisual(<bang>0)

""-----------------------------------------------------------------------------
"" 文件检索
""-----------------------------------------------------------------------------
"function! s:FilesWithWiki(query, fullscreen)
"    let spec = {'options': [
"                \ '--info=inline',
"                \ '--preview', s:preview_program . ' {}',
"                \ s:preview_window
"                \ ]}

"    if empty(a:query) && &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
"        let l:path = g:vimwiki_path
"    elseif a:query == ''
"        let l:path = getcwd()
"    else
"        let l:path = a:query
"    endif
"    call fzf#vim#files(l:path, spec, a:fullscreen)
"endfunction
"command! -bang -nargs=? -complete=dir FWW call s:FilesWithWiki(<q-args>, <bang>0)

""-----------------------------------------------------------------------------
"" quickfix 与 locallist
""-----------------------------------------------------------------------------
"function! s:error_type(type, nr) abort
"    if a:type ==? 'W' | let l:msg = ' warning'
"    elseif a:type ==? 'I' | let l:msg = ' info'
"    elseif a:type ==? 'E' || (a:type ==# "\0" && a:nr > 0) | let l:msg = ' error'
"    elseif a:type ==# "\0" || a:type ==# "\1" | let l:msg = ''
"    else | let l:msg = ' ' . a:type | endif

"    if a:nr <= 0 | return l:msg | endif

"    return printf('%s %3d', l:msg, a:nr)
"endfunction

"function! s:formatError(item) abort
"    return (a:item.bufnr ? bufname(a:item.bufnr) : '')
"            \ . ':' . (a:item.lnum  ? a:item.lnum : '')
"            \ . ':' . (a:item.col ? ' col ' . a:item.col : '')
"            \ . ' | ' . s:error_type(a:item.type, a:item.nr)
"            \ . ' | ' . substitute(a:item.text, '\v^\s*', ' ', '')
"endfunction

"function! s:quickfixOrLocalListHandler(err) abort
"    let l:err_list = split(a:err, '|')
"    let l:fn_ln = split(l:err_list[0], ':')
"    let l:file_name = l:fn_ln[0]
"    let l:line = ""
"    let l:col = 0
"    if len(l:fn_ln) == 2
"        let l:line = l:fn_ln[1]
"    elseif len(l:fn_ln) == 3
"        let l:line = l:fn_ln[1]
"        let l:col  = l:fn_ln[2]
"    endif

"    if bufnr(l:file_name) != bufnr("%")
"        execute 'buffer'.bufnr(l:file_name)
"    endif

"    if !empty(l:line) && str2nr(l:line) > -1
"        call cursor(str2nr(l:line), str2nr(l:col))
"    else | return | endif
"    normal! zvzz
"    return
"endfunction

"" TODO 编写高亮
"function! s:FzfQuickfixOrLocalList(...) abort
"    call fzf#run(fzf#wrap({
"            \ 'source': map(a:1 ? getloclist(0) : getqflist(), 's:formatError(v:val)'),
"            \ 'sink': function('<SID>quickfixOrLocalListHandler'),
"            \ 'options': [
"                \ (a:1 ? '--prompt=LocList' : '--prompt=QfList'),
"                \ '--info=inline',
"                \ '--preview', s:preview_program . ' {1}',
"                \ s:preview_window
"            \ ],
"            \ }))
"endfunction
"command! FzfQuickfix  call <SID>FzfQuickfixOrLocalList(0)
"command! FzfLocationList  call <SID>FzfQuickfixOrLocalList(1)

""-----------------------------------------------------------------------------
"" jumps
""-----------------------------------------------------------------------------
"" TODO 增加颜色
"" TODO 定位当前所在的位置而不是总是置顶
"" 当前jump所在的位置
"" let s:jump_current_line = 0
"function! s:jumpListFormat(val) abort
"    let l:file_name = bufname('%')
"    let l:file_name = empty(l:file_name) ? 'Unknown file name' : l:file_name
"    let l:curpos = getcurpos()
"    let l:l = matchlist(a:val, '\(>\?\)\s*\(\d*\)\s*\(\d*\)\s*\(\d*\) \?\(.*\)')
"    let [l:mark, l:jump, l:line, l:col, l:content] = l:l[1:5]
"    if empty(trim(l:mark)) | let l:mark = '-' | endif

"    if filereadable(expand(fnameescape(l:content)))
"        let l:file_name = expand(l:content)
"        let l:bn = bufnr(l:file_name)
"        if l:bn > -1 && buflisted(l:bn) > 0
"            let l:content = getbufline(l:bn, l:line)
"            let l:content = empty(l:content) ? "" : l:content[0]
"        else
"            let l:content = system("sed -n " . l:line . "p " . l:file_name)
"        endif
"    elseif empty(trim(l:content))
"        if empty(trim(l:line))
"            let [l:line, l:col] = l:curpos[1:2]
"        endif
"        let l:content = getline(l:line, l:line)[0]
"    endif
"    return l:mark . " " . l:file_name . ":" . l:line . ":" . l:col . " " . l:content
"endfunction

"function! s:jumpList() abort
"    let l:jl = execute('jumps')
"    return map(reverse(split(l:jl, '\n')[1:]), 's:jumpListFormat(v:val)')
"endfunction

"function! s:jumpHandler(jp)
"    let l:l = matchlist(a:jp, '\(.\)\s\(.*\):\(\d\+\):\(\d\+\)\(.*\)')
"    let [l:file_name, l:line, l:col, l:content] = l:l[2:5]

"    if empty(l:file_name) || empty(l:line) | return | endif
"    " 判断文件是否已经存在buffer中
"    let l:bn = bufnr(l:file_name)
"    " 未打开
"    if l:bn == -1 | if filereadable(l:file_name) | execute 'e ' . 'l:file_name' | endif
"    else | execute 'buffer ' . l:bn | endif
"    call cursor(str2nr(l:line), str2nr(l:col))
"    normal! zvzz
"endfunction

"function! s:FzfJumps() abort
"    call fzf#run(fzf#wrap({
"            \ 'source': s:jumpList(),
"            \ 'sink': function('<SID>jumpHandler'),
"            \ 'options': [
"                \ '--prompt=Jumps',
"                \ '--preview', s:preview_program . ' {2}',
"                \ s:preview_window
"            \ ],
"            \ }))
"endfunction
"command! -bang -nargs=* FzfJumps call s:FzfJumps()


""-----------------------------------------------------------------------------
"" marks
""-----------------------------------------------------------------------------
"function! s:marksListFormat(val)
"    let l:l = matchlist(a:val, '\s*\(.\)\s*\(\d\+\)\s*\(\d\+\)\(.*\)')
"    let [l:mark, l:line, l:col, l:content] = l:l[1:4]

"    let l:file_name = bufname('%')
"    if filereadable(l:content)
"        let l:file_name = l:content
"        let l:bn = bufnr(l:file_name)
"        if l:bn > -1 && buflisted(l:bn) > 0
"            let l:content = getbufline(l:bn, l:line)[0]
"        else
"            let l:content = system("sed -n " . l:line . "p " . l:file_name)
"        endif
"    endif
"    return l:mark . ' ' . l:file_name . ':' . l:line . ':' . l:col . ' ' . l:content
"endfunction

"function! s:marksList() abort
"    let l:ms = execute('marks')
"    return map(split(l:ms, '\n')[1:], '<SID>marksListFormat(v:val)')
"endfunction

"function! s:marksHandler(mr) abort
"    let l:l = matchlist(a:mr, '\(.\)\s*\(.*\):\(\d\+\):\(\d\+\)\s*\(.*\)')
"    let [l:mark, l:file_name, l:line, l:col, l:content] = l:l[1:5]

"    let l:bn = bufnr(l:file_name)
"    if l:bn == -1
"        if filereadable(l:file_name) | execute 'e ' . l:file_name | endif
"    else | execute 'buffer' . l:bn | endif
"    call cursor(str2nr(l:line), str2nr(l:col))
"    normal! zvzz
"endfunction

"function! s:FzfMarks() abort
"    call fzf#run(fzf#wrap({
"            \ 'source': s:marksList(),
"            \ 'sink': function('<SID>marksHandler'),
"            \ 'options': [
"                \ '--prompt=Marks',
"                \ '--preview', s:preview_program .  ' {2}',
"                \ s:preview_window
"            \ ],
"            \ }))
"endfunction
"command! -bang -nargs=* FzfMarks call s:FzfMarks()


""-----------------------------------------------------------------------------
"" buffer lines
""-----------------------------------------------------------------------------
"function! s:blinesHandler(lines) abort
"    if len(a:lines) < 2
"        return
"    endif
"    execute split(a:lines, '\t')[0]
"    normal! zvzz
"endfunction

"function! s:blinesList() abort
"    let fmtexpr = 'printf("%4d\t%s", v:key + 1, v:val)'
"    let lines = getline(1, '$')
"    return map(lines, fmtexpr)
"endfunction

"function! s:FzfBLines(...) abort
"    if a:0 == 0
"        let l:query = ""
"    else
"        let l:query = a:1
"    endif

"    let l:cur_buf_name = expand('%')
"    if empty(l:cur_buf_name)
"        let l:preview = 'echo please save first to preview'
"    else
"        let l:preview = s:preview_program . ' ' . l:cur_buf_name . ':{1}'
"    endif
"    call fzf#run(fzf#wrap({
"            \ 'source': s:blinesList(),
"            \ 'sink': function('<SID>blinesHandler'),
"            \ 'options': [
"                \ '--prompt=BLines>',
"                \ '--query', l:query,
"                \ '--preview', l:preview,
"                \ s:preview_window
"            \ ],
"            \ }))
"endfunction
"" function s:FzfBLinesVisual() abort
""     call s:FzfBLines(common#functions#getVisualSelection())
"" endfunction
"command! -bang -nargs=* FzfBLines call s:FzfBLines()
"command! -range=% -bang FzfBLinesVisual <line1>,<line2>call s:FzfBLinesVisual()

""-----------------------------------------------------------------------------
"" yank depends on coc-yank
""-----------------------------------------------------------------------------

""-----------------------------------------------------------------------------
"" register
""-----------------------------------------------------------------------------

""-----------------------------------------------------------------------------
"" 自定义快捷键
""-----------------------------------------------------------------------------
"nnoremap <M-f> :FWW<CR>
"nnoremap <M-F> :FWW $HOME<CR>
"nnoremap <M-b> :Buffers<CR>
"" if common#functions#HasPlug('vista.vim')
""     let g:vista_fzf_preview = ['up:50%:wrap']
""     noremap <M-t> :Vista finder<CR>
"" else
""     nnoremap <M-t> :BTags<CR>
"" endif
"nnoremap <M-T> :Tags<CR>
"nnoremap <M-s> :GrepWithWiki<CR>
"vnoremap <M-s> :GrepWithWikiVisual<CR>
"" 模糊搜索当前buffer
"nnoremap ? :FzfBLines<CR>
"vnoremap ? :FzfBLinesVisual<CR>
"nnoremap <M-r> :History<CR>
"" TODO 增加changes 需要自定义
"nnoremap <M-c> :Commands<CR>
"" 如果coc-fzf支持marks的话就用coc-fzf+coc-bookmarks
"nnoremap <M-m> :FzfMarks<CR>
"" nnoremap <M-m> :Marks<CR>
"nnoremap <M-M> :Maps<CR>
"nnoremap <M-w> :Windows<CR>
"" if common#functions#HasPlug('coc-fzf')
""     nnoremap <M-y> :<c-u>CocFzfList yank<CR>
"" endif
"" TODO 编写高亮
"nnoremap <M-J> :FzfJumps<CR>

"" TODO 编写高亮
"" quickfix与locationlist
"nnoremap <F8> :FzfQuickfix<CR>
"nnoremap <F9> :FzfLocationList<CR>
