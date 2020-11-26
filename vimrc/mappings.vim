
" 显示文件大小
function! GetFilesize(file)
        let size        =        getfsize(expand(a:file))
        echo 'Size of ' a:file ' is ' size ' bytes'
endfunction

map <leader>sz :call GetFilesize(@%)<CR>

" 3. 常用键位的映射

inoremap jk <ESC>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Write buffer (save)保存
noremap <Leader>w :w<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

"取消高亮
"map <leader>n :nohl<CR>

"插入模式下快速回到normal模式并且到新行
inoremap <C-O> <Esc>o

nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
"删除buffer
nnoremap <C-x>  :bd<CR>

"选择窗口
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

"智能行移动
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove


" Tab move lines left or right (c-Ctrl,s-Shift)
nmap    <c-tab>     v>
nmap    <s-tab>     v<
vmap    <c-tab>     >gv
vmap    <s-tab>     <gv

" tab navigation like zsh
" :nmap <leader>h :tabprevious<CR>
" :nmap <leader>l :tabnext<CR>

" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>


" 常用
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
map <leader>sa ggVG"



" 打开terminal,水平分屏
" :terminal
" :term
" :ter
" 打开terminal,垂直分屏
" :vertical terminal
" :vert ter
" 关闭terminal
" exit or <CTRL-D>
