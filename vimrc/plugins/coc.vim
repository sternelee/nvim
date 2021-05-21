" coc config
let g:coc_start_at_startup=0

function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(3000,'CocTimerStart',{'repeat':1})

let g:trigger_size = 0.5 * 1048576

augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END

let g:coc_global_extensions = [
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-lists',
  \ 'coc-dictionary',
  \ 'coc-marketplace',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-translator',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-gitignore',
  \ 'coc-explorer',
  \ 'coc-project',
  \ 'coc-vetur',
  \ 'coc-toml',
  \ 'coc-tabnine',
  \ 'coc-emoji',
  \ 'coc-prettier'
  \ ]

set updatetime=300
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent>K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

autocmd CursorHold * silent call CocActionAsync('highlight')

function OverrideCocHighlights()
  hi! CocRustChainingHint NONE
  hi! link CocRustChainingHint Comment
endfunction

au Colorscheme * call OverrideCocHighlights()
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap <silent><C-d> <Plug>(coc-range-select)
xmap <silent><C-d> <Plug>(coc-range-select)
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent><space>a :<C-u>CocList diagnostics<cr>
nnoremap <silent><space>E :<C-u>CocList extensions<cr>
nnoremap <silent><space>C :<C-u>CocList commands<cr>
nnoremap <silent><space>o :<C-u>CocList outline<cr>
nnoremap <silent><space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent><space>N :<C-u>CocNext<CR>
nnoremap <silent><space>P :<C-u>CocPrev<CR>
nnoremap <silent><space>R :<C-u>CocListResume<CR>
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
nnoremap <silent><space>lw :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent><space>ff :<C-u>CocList files<cr>
nnoremap <silent><space>fg :<C-u>CocList grep<cr>
nnoremap <silent><space>fb :<C-u>CocList buffers<cr>
command! -nargs=0 Format :CocCommand prettier.formatFile
nmap <Leader>ct <Plug>(coc-translator-p)
vmap <Leader>ct <Plug>(coc-translator-pv)
nnoremap <Leader>e :CocCommand explorer<CR>
