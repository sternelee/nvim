let g:any_jump_disable_default_keybindings = 1
" Normal mode: Jump to definition under cursore
nnoremap <leader>aj :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>aj :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>
