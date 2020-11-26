nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_map =  {}
let g:which_key_map = {
      \ 'name' : '+Leaderkey' ,
      \ '1' : 'Buffer-1'      ,
      \ '2' : 'Buffer-2'      ,
      \ '3' : 'Buffer-3'      ,
      \ '4' : 'Buffer-4'      ,
      \ '5' : 'Buffer-5'      ,
      \ '6' : 'Buffer-6'      ,
      \ '7' : 'Buffer-7'      ,
      \ '8' : 'Buffer-8'      ,
      \ '9' : 'Buffer-9'      ,
      \ '0' : 'Buffer-10'      ,
      \ 'n' : 'Cancelhighlight',
      \ 'w' : 'Save',
      \ 'h' : 'Tabpre',
      \ 'l' : 'Tabnext',
      \ ',' : {
            \ 'name' : '+Easymotion',
            \ 'w' : 'Easymotion-w',
            \ 'b' : 'Easymotion-b',
            \ 'f' : 'Easymotion-f',
            \ },
      \ 'c' : {
            \ 'name' : '+NerdCommenter',
            \ },
      \ 'b' : {
            \ 'name' : '+Buffer',
            \ 'n'    : 'NextBuffer',
            \ 'p'    : 'PreBuffer',
            \ },
      \ }

let g:which_key_local_map ={
      \ 'name' : '+LocalLeaderKey'  ,
      \ 'c'    : {
              \ 'name' : '+CocList' ,
              \ 'a'    : 'CocDiagnostics',
              \ 'c'    : 'CocCommands',
              \ 'e'    : 'CocExtensions',
              \ 'j'    : 'CocNext',
              \ 'k'    : 'CocPrev',
              \ 'o'    : 'CocOutLine',
              \ 'r'    : 'CocResume',
              \ 's'    : 'CocIsymbols',
              \ },
      \ 'g'    : 'Open-Tagbar',
      \ 'f'    : 'FzfRgWord',
      \ 'l'    : 'DeniteLine',
      \ 'o'    : 'DeniteFileOld',
      \ 'r'    : 'DeniteFileMru',
      \ 's'    : 'DeniteCode',
      \ 'w'    : 'DeniteCursorWorld',
      \ 'd'    : 'DefxToggle',
      \ }

let g:which_key_rsbgmap = {
      \ 'name' : '+RightSquarebrackets',
      \ 'c'    : 'CocDiagnosticsNext',
      \ }

let g:which_key_lsbgmap = {
      \ 'name' : '+LeftSquarebrackets',
      \ 'c'    : 'CocDiagnosticsPre',
      \ }

let g:which_key_use_floating_win = 1
let g:which_key_disable_default_offset = 1

function! RegisterWhichKey()
  call which_key#register('<Space>', 'g:which_key_map')
  call which_key#register(',', 'g:which_key_local_map')
endfunction

autocmd! User vim-which-key call RegisterWhichKey()
