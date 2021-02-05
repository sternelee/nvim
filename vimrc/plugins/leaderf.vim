" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_ShortcutF = '<A-z>`````ff'
" let g:Lf_ShortcutB = '<A-z>`````ff'
" let g:Lf_WindowHeight = 0.4
" let g:Lf_ShowRelativePath = 0
" let g:Lf_CursorBlink = 1
" let g:Lf_CacheDirectory = expand('~/.cache/vim/leaderf')
" let g:Lf_StlSeparator = { 'left': '', 'right': '' }
" let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.vscode']
" let g:Lf_ShowHidden = 1
" let g:Lf_ReverseOrder = 1
" let g:Lf_PreviewHorizontalPosition = 'center'
" " let g:Lf_StlColorscheme = 'gruvbox_material'
" " let g:Lf_PopupColorscheme = 'gruvbox_material'
" let g:Lf_PreviewResult = {
"       \ 'File': 0,
"       \ 'Buffer': 0,
"       \ 'Mru': 0,
"       \ 'Tag': 0,
"       \ 'BufTag': 0,
"       \ 'Function': 0,
"       \ 'Line': 0,
"       \ 'Colorscheme': 0,
"       \ 'Rg': 0,
"       \ 'Gtags': 0
"       \}
" let g:Lf_WildIgnore = {
"       \ 'dir': ['.svn','.git','.hg', '.vscode', 'node_modules', 'dist'],
"       \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
"       \}
" let g:Lf_RgConfig = [
"       \ '--glob=!\.git/*',
"       \ '--glob=!\.vscode/*',
"       \ '--glob=!dist/*',
"       \ '--glob=!node_modules/*',
"       \ '--glob=!\.svn/*',
"       \ '--glob=!\.hg/*',
"       \ '--case-sensitive',
"       \ has('win32') ? '--crlf' : '--no-crlf',
"       \ '--multiline',
"       \ '--hidden'
"       \ ]
" map <leader>f :LeaderfFile<CR>
" map <leader>u :LeaderfFunction<CR>
" map <leader>b :LeaderfBuffer<CR>
" map <leader>g :Leaderf rg<CR>
" map <leader>lc :LeaderfColorscheme<CR>
" " map <leader>gg :Leaderf gtags<CR>

" "" search word under cursor, the pattern is treated as regex, and enter normal mode directly
" noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

"" search wxnoremapnoremaord under cureat as regex,
"" append the result to previous search results.
"" noremap <leader>fg :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>

"" search word under cursor literally only in current buffer
"noremap <leader>ff :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>

"" search word under cursor literally in all listed buffers
""noremap <C-D> :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ", expand("<cword>"))<CR>

"" search visually selected text literally, don't quit LeaderF after accepting an entry
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>

"" recall last search. If the result window is closed, reopen it.
" noremap <leader>fo :<C-U>Leaderf! rg --recall<CR>


"" search word under cursor in *.h and *.cpp files.
""noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp", expand("<cword>"))<CR>
"" the same as above
""noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,cpp}", expand("<cword>"))<CR>

"" search word under cursor in cpp and java files.
""noremap <Leader>b :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -t java", expand("<cword>"))<CR>

"" search word under cursor in cpp files, exclude the *.hpp files
""noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*.hpp", expand("<cword>"))<CR>

"let g:Lf_GtagsAutoGenerate = 0
"let g:Lf_Gtagslabel = 'native-pygments'
"noremap <leader>gr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>gd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>go :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" scriptencoding utf-8

" 書き方は以下を参照
" * https://github.com/Yggdroot/LeaderF/issues/144#issuecomment-540008950
" * http://bit.ly/2NdiX1x

" :Leaderf packadd
" :Leaderf git_checkout
" :Leaderf mrw
" :Leaderf todo

" let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})

" ============================================================================
" packadd
" function! LfExt_packadd_source(args) abort
"     let l:result = []
"     for path in split(globpath(&packpath, '/pack/*/opt/*'))
"         if isdirectory(path)
"             call add(l:result, fnamemodify(path, ':t'))
"         endif
"     endfor
"     return l:result
" endfunction

" function! LfExt_packadd_accept(line, args) abort
"     execute 'packadd '.a:line
" endfunction

" let g:Lf_Extensions.packadd = {
" \   'source': 'LfExt_packadd_source',
" \   'accept': 'LfExt_packadd_accept',
" \}
" command! Tpackadd Leaderf packadd
" " ============================================================================

" " ============================================================================
" " git checkout
" function! LfExt_git_checkout_source(args) abort
"     let l:source = filter(systemlist('git branch'), 'v:val[0] !=# "*"')
"     if empty(source)
"         echohl ErrorMsg
"         echo 'no other branch'
"         echohl None
"         return []
"     endif
"     return l:source
" endfunction

" function! LfExt_git_checkout_accept(line, args) abort
"     call system('git checkout ' . a:line)
" endfunction

" let g:Lf_Extensions.git_checkout = {
" \   'source': 'LfExt_git_checkout_source',
" \   'accept': 'LfExt_git_checkout_accept',
" \}
" command! LfGitCheckout Leaderf git_checkout --popup
" ============================================================================

" ============================================================================
" mrw
" function! LfExt_mrw_source(args) abort
"     let l:files = mrw#read_cachefile(expand('%'))
"     let l:result = []
"     " from mrw.vim
"     let l:max_filename_len = max(map(copy(l:files), {i,x -> strdisplaywidth(fnamemodify(x, ':p:t'))}) + [0])
"     for l:file in l:files
"         let l:name = fnamemodify(l:file, ':p:t')
"         let l:space = l:max_filename_len - strdisplaywidth(l:name)
"         call add(l:result, printf('%s%s "%s"', l:name, repeat(' ', l:space), fnamemodify(l:file, ':p:h')))
"     endfor
"     return l:result
" endfunction

" function! LfExt_mrw_get_digest(line, mode) abort
"     if a:mode ==# 0
"         return [a:line, 0]
"     elseif a:mode ==# 1
"         let l:end = stridx(a:line, ' ')
"         return [a:line[:l:end-1], 0]
"     else
"         let l:start = stridx(a:line, ' "')
"         return [a:line[l:start+2: -1], strlen(a:line) - 1]
"     endif
" endfunction

" function! LfExt_mrw_accept(line, args) abort
"     let l:path = LfExt_mrw_get_digest(a:line, 2)[0][:-2]
"     \           . '/'
"     \           . LfExt_mrw_get_digest(a:line, 1)[0]
"     exec 'drop ' . l:path
" endfunction

" let g:Lf_Extensions.mrw = {
" \   'source': 'LfExt_mrw_source',
" \   'accept': 'LfExt_mrw_accept',
" \   'get_digest': 'LfExt_mrw_get_digest',
" \   'supports_name_only': 1,
" \}
" ============================================================================

" ============================================================================
" todo
" let s:todo_dict = {
" \   'cancel':           'call todo#ToggleMarkAsDone("Cancelled")',
" \   'done':             'call todo#ToggleMarkAsDone("")',
" \   'remove_complete':  'call todo#RemoveCompleted()',
" \   'add_due':          "normal! A due:\<C-R>=strftime('%Y-%m-%d')\<CR>\<Esc>0"
" \}

" function! LfExt_todo_source(args) abort
"     return keys(s:todo_dict)
" endfunction

" function! LfExt_todo_accept(line, args) abort
"     silent execute s:todo_dict[a:line]
" endfunction

" let g:Lf_Extensions.todo = {
" \   'source': 'LfExt_todo_source',
" \   'accept': 'LfExt_todo_accept',
" \}
" ============================================================================
