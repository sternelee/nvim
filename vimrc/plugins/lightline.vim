let g:lightline = {
      \ 'colorscheme': 'nightfly',
      \ 'active': {
      \   'left': [ ['homemode'],['mode', 'filename'],
      \             ['gitbranch'],['coc_error', 'coc_warning', 'coc_hint', 'coc_info']],
      \   'right':[ ['lineinfo'],
      \             ['percent'], ['fileformat','fileencoding'] , ['asyncrun_status']],
      \ },
      \ 'inactive': {
      \   'left': [['homemode'], ['gitbranch']],
      \   'right':[['lineinfo'], ['percent']],
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['close']],
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'coc_error'        : 'LightlineCocErrors',
      \   'coc_warning'      : 'LightlineCocWarnings',
      \   'coc_info'         : 'LightlineCocInfos',
      \   'coc_hint'         : 'LightlineCocHints',
      \   'coc_fix'          : 'LightlineCocFixes',
      \   'asyncrun_status': 'lightline#asyncrun#status',
      \ },
      \ 'component_function': {
      \   'homemode': 'LightlineMode',
      \   'gitbranch': 'gitbranch#name',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \ },
      \ 'component_type': {'buffers': 'tabsel'},
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"}
      \ }
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
function! LightlineMode()
  let nr = s:get_buffer_number()
  let nmap = [ '0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20']
  let num = nmap[nr]
  if nr == 0
    return ''
  endif
  return join([num])
endfunction

function! s:get_buffer_number()
  let i = 0
  for nr in filter(range(1, bufnr('$')), 'bufexists(v:val) && buflisted(v:val)')
    let i += 1
    if nr == bufnr('')
      return i
    endif
  endfor
  return ''
endfunction

function! NearestMethodOrFunction()
  let l:method = get(b:, 'vista_nearest_method_or_function', '')
  if l:method != ''
    let l:method = '[' . l:method . ']'
  endif
  return l:method
endfunction

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  return printf('%s%d', a:sign, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'E')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'W')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'I')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'H')
endfunction

autocmd User CocDiagnosticChange call lightline#update()

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ') : ''
endfunction

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#number_map = {
      \ 0: '0', 1: '1', 2: '2', 3: '3', 4: '4',
      \ 5: '5', 6: '6', 7: '7', 8: '8', 9: '9'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
