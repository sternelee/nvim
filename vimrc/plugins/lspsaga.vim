nnoremap <silent>gh :Lspsaga lsp_finder<CR>
nnoremap <silent>ca :Lspsaga code_action<CR>
vnoremap <silent>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
" 使用滚轮来上下翻页
nnoremap <silent>gs :Lspsaga signature_help<CR>
nnoremap <silent><Leader>rn :Lspsaga rename<CR>
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
nnoremap <silent><A-d> :Lspsaga preview_definition<CR>
nnoremap <silent><leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent><leader>cc :Lspsaga show_cursor_diagnostics()<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
highlight link LspSagaFinderSelection Search
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
