scriptencoding utf-8

" 書き方は以下を参照
" * https://github.com/Yggdroot/LeaderF/issues/144#issuecomment-540008950
" * http://bit.ly/2NdiX1x

" :Leaderf packadd
" :Leaderf git_checkout
" :Leaderf mrw
" :Leaderf todo

let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})

" ============================================================================
" packadd
function! LfExt_packadd_source(args) abort
    let l:result = []
    for path in split(globpath(&packpath, '/pack/*/opt/*'))
        if isdirectory(path)
            call add(l:result, fnamemodify(path, ':t'))
        endif
    endfor
    return l:result
endfunction

function! LfExt_packadd_accept(line, args) abort
    execute 'packadd '.a:line
endfunction

let g:Lf_Extensions.packadd = {
\   'source': 'LfExt_packadd_source',
\   'accept': 'LfExt_packadd_accept',
\}
command! Tpackadd Leaderf packadd
" ============================================================================

" ============================================================================
" git checkout
function! LfExt_git_checkout_source(args) abort
    let l:source = filter(systemlist('git branch'), 'v:val[0] !=# "*"')
    if empty(source)
        echohl ErrorMsg
        echo 'no other branch'
        echohl None
        return []
    endif
    return l:source
endfunction

function! LfExt_git_checkout_accept(line, args) abort
    call system('git checkout ' . a:line)
endfunction

let g:Lf_Extensions.git_checkout = {
\   'source': 'LfExt_git_checkout_source',
\   'accept': 'LfExt_git_checkout_accept',
\}
command! LfGitCheckout Leaderf git_checkout --popup
" ============================================================================

" ============================================================================
" mrw
function! LfExt_mrw_source(args) abort
    let l:files = mrw#read_cachefile(expand('%'))
    let l:result = []
    " from mrw.vim
    let l:max_filename_len = max(map(copy(l:files), {i,x -> strdisplaywidth(fnamemodify(x, ':p:t'))}) + [0])
    for l:file in l:files
        let l:name = fnamemodify(l:file, ':p:t')
        let l:space = l:max_filename_len - strdisplaywidth(l:name)
        call add(l:result, printf('%s%s "%s"', l:name, repeat(' ', l:space), fnamemodify(l:file, ':p:h')))
    endfor
    return l:result
endfunction

function! LfExt_mrw_get_digest(line, mode) abort
    if a:mode ==# 0
        return [a:line, 0]
    elseif a:mode ==# 1
        let l:end = stridx(a:line, ' ')
        return [a:line[:l:end-1], 0]
    else
        let l:start = stridx(a:line, ' "')
        return [a:line[l:start+2: -1], strlen(a:line) - 1]
    endif
endfunction

function! LfExt_mrw_accept(line, args) abort
    let l:path = LfExt_mrw_get_digest(a:line, 2)[0][:-2]
    \           . '/'
    \           . LfExt_mrw_get_digest(a:line, 1)[0]
    exec 'drop ' . l:path
endfunction

let g:Lf_Extensions.mrw = {
\   'source': 'LfExt_mrw_source',
\   'accept': 'LfExt_mrw_accept',
\   'get_digest': 'LfExt_mrw_get_digest',
\   'supports_name_only': 1,
\}
" ============================================================================

" ============================================================================
" todo
let s:todo_dict = {
\   'cancel':           'call todo#ToggleMarkAsDone("Cancelled")',
\   'done':             'call todo#ToggleMarkAsDone("")',
\   'remove_complete':  'call todo#RemoveCompleted()',
\   'add_due':          "normal! A due:\<C-R>=strftime('%Y-%m-%d')\<CR>\<Esc>0"
\}

function! LfExt_todo_source(args) abort
    return keys(s:todo_dict)
endfunction

function! LfExt_todo_accept(line, args) abort
    silent execute s:todo_dict[a:line]
endfunction

let g:Lf_Extensions.todo = {
\   'source': 'LfExt_todo_source',
\   'accept': 'LfExt_todo_accept',
\}
" ============================================================================