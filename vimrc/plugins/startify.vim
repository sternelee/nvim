" For startify
let g:startify_session_autoload = 1
let g:startify_change_to_dir = 1
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_custom_header = [
            \ '+------------------------------+',
            \ '|  Welcome to My Neovim.       |',
            \ '|                              |',
            \ '|  http://sterne.me/           |',
            \ '+----------------+-------------+',
            \]

let g:startify_custom_footer = [
            \ '+------------------------------+',
            \ '|  I Love You, 小璇同学❤❤❤    |',
            \ '+----------------+-------------+',
            \]

nnoremap <Leader>S :Startify<Cr>
