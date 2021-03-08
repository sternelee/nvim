" 参考: https://www.sainnhe.dev/post/status-line-config/
" gvim需要把lua53.dll放在与gvim.exe同级下
" https://yianwillis.github.io/vimcdoc/doc/quickref.html
" https://github.com/neovim/neovim/wiki/Related-projects#gui
" windows 推荐使用Nvy
" 1. 初始化
"map syntax sync fromstart
nmap tu :syntax sync fromstart<cr>

" 2. 初始配置
" 去掉python依赖
" let g:python3_host_prog=" 建议使用scoop install -g python
let g:loaded_python_provider = 0
" let g:python_host_prog = '/usr/local/bin/python'
" let g:python_host_skip_check=1
let g:loaded_python3_provider = 0
" let g:python3_host_prog = 'C:\ProgramData\scoop\shims\python3.EXE'
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

"更新配置 :so $MYVIMRC
"设置默认编码
set encoding=utf-8
set langmenu=zh_CN
"提示信息乱码解决
language message zh_CN.UTF-8
" 设置文件编码
set fileencodings=utf-8,ucs-bom,chinese,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
filetype on         " 开启文件类型侦测
filetype plugin on  " 根据侦测到的不同类型加载对应的插件
" autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效
set incsearch       " 开启实时搜索功能
set ignorecase      " 搜索时大小写不敏感
set wildmenu        " vim 自身命令行模式智能补全
set linebreak
set mouse=a         " 设置鼠标滚动
set gcr=a:block-blinkon0   " 禁止光标闪烁
if has('gui_running')
  " 禁止显示滚动条
  set guioptions-=m " Hide menu bar.
  set guioptions-=T " Hide toolbar
  set guioptions-=L " Hide left-hand scrollbar
  set guioptions-=r " Hide right-hand scrollbar
  set guioptions-=b " Hide bottom scrollbar
  set showtabline=0 " Hide tabline
  " 使用内置 tab 样式而不是 gui
  set guioptions-=e " Hide tab
endif

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"" 启动 vim 时自动全屏
" autocmd VimEnter * call ToggleFullscreen()
set laststatus=2   " 总是显示状态栏
set noshowcmd
set ruler          " 显示光标当前位置
set number         " 开启行号显示
                   " 取消显示绝对行号   set nonumber
set relativenumber " 显示相对行号
                   " 取消显示相对行号   set norelativenumber

set cursorline    " 高亮显示当前 - 行
" set cursorcolumn  " 高亮显示当前 - 列
set hlsearch      " 高亮显示搜索结果
set nolist
" 在处理未保存或只读文件的时候，弹出确认
" set confirm
set nowrap " 禁止折行
syntax enable " 开启语法高亮功能
set synmaxcol=256 " 高亮限制前x列
syntax on     " 允许用指定语法高亮配色方案替换默认方案
" syntax sync minlines=256
autocmd BufEnter * :syn sync maxlines=500
syntax sync fromstart
set redrawtime=2000
filetype indent on  " 自适应不同语言的智能缩进
set expandtab       " 将制表符扩展为空格
set tabstop=2       " 设置编辑时制表符占用空格数
set shiftwidth=2    " 设置格式化时制表符占用空格数
set softtabstop=2   " 让 vim 把连续数量的空格视为一个制表符
" set foldmethod=manual   " 基于缩进或语法进行代码折叠
                        " 手动建立折叠（manual）、
                        " 基于缩进进行折叠（indent）、
                        " 基于语法进行折叠（syntax）注意插入模式容易卡顿
                        " 未更改文本构成折叠（diff）等等，
set nofoldenable       " 启动 vim 时关闭折叠代码
" set foldlevelstart=99    " 打开文件默认不折叠
set fileformat=unix
set fileformats=unix,dos

set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set nowritebackup
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set noeb
set vb
set splitbelow
set bsdir=buffer        " 设定文件浏览器目录为当前目录
if &compatible
  set nocompatible " 关闭兼容模式
endif
set autoindent
set smartindent
set smarttab
set cindent
set showtabline=2
set noshowmode
set shortmess=a
set cmdheight=1
if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
set clipboard+=unnamed " 剪切板共享
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=300
set scrolljump=5
"set re=1
" set autochdir 自动pwd到文件当前目录
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start
set nrformats-=octal
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set fillchars=vert:│,fold:·
set hidden
set wildignore+=*\\node_modules\\*,*.swp,*.zip,*.exe  " Windows
" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

if has('nvim')
    set inccommand=split
    set guifont=Iosevka:h18
    let s:fontname='Iosevka'
  else
    set guifont=Iosevka_NF:h16:W300:cANSI:qDRAFT
    let s:fontname='Iosevka_NF'
endif

if has('nvim') || has('termguicolors')
  set termguicolors
endif

" gvim可使用 :set guifont=* 来选择字体 Operator Mono Lig 三号

" set guifont=Operator_Mono_Lig_Light:h18
let s:fontsize = 14
" let s:fontname='Operator Mono Lig Light'
" let g:Powerline_symbols='unicode'
" 改变字体大小
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! " .s:fontname.":h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
" autocmd VimEnter * call AdjustFontSize(-1)

" 显示相对路径
" set statusline=%f

" 设置启动的工作路径
" let g:Work = "D:/www"
" let g:Xunlei = g:Work."/xunlei/"
" function! Cw(dir)
"     execute ":cd  ".a:dir
" endfunction
" call Cw(Xunlei)

autocmd syntax *
  \ let a=0+system("wc -L ".expand("%")."|awk '{printf $1}'") |
  \ if a >= 200 |
  \    syntax off |
  \ endif


let g:neovide_fullscreen=v:true
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_cursor_antialiasing=v:true


augroup MyAutoCmd
	autocmd!
	autocmd CursorHold *? syntax sync minlines=256
augroup END

syntax enable
set secure

" vim卡顿 https://github.com/wklken/k-vim/issues/233
" 主要是因为syntax on. 如果syntax off会好很多
set foldmethod=manual

" 窗口相关快捷键
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
" 更改窗口垂直大小
nnoremap <M--> :resize +3<CR>
nnoremap <M-_> :resize -3<CR>
" 更改窗口水平大小
nnoremap <M-(> :vertical resize -3<CR>
nnoremap <M-)> :vertical resize +3<CR>
" 分割窗口
nnoremap <c-w>k :abo split <cr>
nnoremap <c-w>h :abo vsplit <cr>
nnoremap <c-w>j :rightbelow split <cr>
nnoremap <c-w>l :rightbelow vsplit <cr>
" 关闭窗口
nnoremap <silent> q <esc>:close<cr>
vnoremap <silent> q <esc>:close<cr>

" 使用回车打开关闭折叠
nnoremap <CR> za
" shift enter，为何不可以？
nnoremap <S-Return> zMzo
" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" 命令行移动
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
" cnoremap <C-l> <Right>
" cnoremap <C-j> <Left>

" 使用leader q执行宏录制功能
nnoremap <leader>q q
" 去除EX模式
nmap Q <nop>
" jk表示esc
inoremap jk <esc>

nmap << <<_
nmap >> >>_

nnoremap ! :!

" 跳转到最后
" 0是跳转到开头
nnoremap 9 $

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

" 新建终端
nnoremap <leader>tt :terminal<cr>

" 插入模式下的一些快捷键
" inoremap <M-o> <esc>o
" inoremap <M-O> <esc>O
" inoremap <M-h> <HOME>
" inoremap <M-l> <END>
" inoremap <c-h> <left>
" inoremap <c-j> <down>
" inoremap <c-k> <up>
" inoremap <c-l> <right>

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction
" noremap <silent> <space><space> <esc>:call common#functions#Wall()<cr>
" noremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
" xnoremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
" noremap <silent> <space><space> <esc>:silent! write<cr>
" xnoremap <silent> <space><space> <esc>:silent! write<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$
nnoremap vv ^vg_

nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
" nnoremap <silent> <M-L> :tabmove +1<cr>
" nnoremap <silent> <M-H> :tabmove -1<cr>
" tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
" tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>

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
" noremap <Leader>w :w<CR>
" imap <C-S> <esc>:w<CR>
" imap <C-Q> <esc>:wq<CR>

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
