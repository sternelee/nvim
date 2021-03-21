" coc config
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(1000,'CocTimerStart',{'repeat':1})

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
  \ 'coc-marketplace',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-translator',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-gitignore',
  \ 'coc-explorer',
  \  'coc-project',
  \  'coc-pairs',
  \  'coc-markdownlint',
  \  'coc-post',
  \  'coc-vetur',
  \  'coc-todolist',
  \  'coc-toml'
  \ ]

" from readme
" if hidden is not set, TextEdit might fail.
" set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

nmap <space>e :CocCommand explorer<CR>

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent>K :call <SID>show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" better color for coc hints
au Colorscheme * call OverrideCocHighlights()

function OverrideCocHighlights()
  hi! CocRustChainingHint NONE
  hi! link CocRustChainingHint Comment
endfunction


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent><C-d> <Plug>(coc-range-select)
xmap <silent><C-d> <Plug>(coc-range-select)

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent><space>a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><space>E :<C-u>CocList extensions<cr>
" Show commands
 nnoremap <silent><space>C :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><space>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><space>N :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><space>P :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><space>R :<C-u>CocListResume<CR>

" Use K to show documentation in preview window
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

" grep current word in current buffer
nnoremap <silent><space>lw :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

" let g:rust_recommended_style = 0

nnoremap <silent><space>ff :<C-u>CocList files<cr>
nnoremap <silent><space>fg :<C-u>CocList grep<cr>
nnoremap <silent><space>fb :<C-u>CocList buffers<cr>
command! -nargs=0 Format :CocCommand prettier.formatFile
" 翻译
nmap <Leader>ct <Plug>(coc-translator-p)
vmap <Leader>ct <Plug>(coc-translator-pv)
