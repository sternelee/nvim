let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:source_rc(path, ...) abort
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('$VIMPATH/vimrc/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction

augroup MyAutoCmd
	autocmd!
	autocmd CursorHold *? syntax sync minlines=256
augroup END

syntax enable

" Loading configuration modules
call s:source_rc('general.vim')
call s:source_rc('plug.vim')
" call s:source_rc('dein.vim')
call s:source_rc('mappings.vim')
call s:source_rc('theme.vim')
"---------------------------------------------------------------------------

set secure

" vim卡顿 https://github.com/wklken/k-vim/issues/233
" 主要是因为syntax on. 如果syntax off会好很多

set foldmethod=manual
