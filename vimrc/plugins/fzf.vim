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
