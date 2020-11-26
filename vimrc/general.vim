" https://yianwillis.github.io/vimcdoc/doc/quickref.html
" https://github.com/neovim/neovim/wiki/Related-projects#gui
" windows 推荐使用Nvy
" 1. 初始化
augroup MyAutoCmd
	autocmd!
	autocmd CursorHold *? syntax sync minlines=300
augroup END

syntax enable

"map syntax sync fromstart
nmap tu :syntax sync fromstart<cr>

" 2. 初始配置

" let g:python3_host_prog=" 建议使用scoop install -g python

" let g:python_host_prog='C:/Python27'
" let g:python3_host_prog='C:/Users/stern/AppData/Local/Programs/Python/Python38-32'
" let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0
" set pyx=3

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
autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效
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
autocmd VimEnter * call ToggleFullscreen()
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
syntax sync minlines=256
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
for f in split(glob('$VIMPATH/vimrc/plugins/*.vim'), '\n')
    exe 'source' f
endfor

if has('nvim')
    set inccommand=split
  else
    set guifont=Iosevka:h16:cANSI
endif

if has('nvim') || has('termguicolors')
  set termguicolors
endif

" gvim可使用 :set guifont=* 来选择字体 Operator Mono Lig 三号

set guifont=Iosevka:h16
" set guifont=Operator_Mono_Lig_Light:h18
let s:fontsize = 14
let s:fontname='Iosevka'
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
let g:Work = "D:/www"
let g:Xunlei = g:Work."/xunlei/"
function! Cw(dir)
    execute ":cd  ".a:dir
endfunction
" call Cw(Xunlei)

autocmd syntax *
  \ let a=0+system("wc -L ".expand("%")."|awk '{printf $1}'") |
  \ if a >= 200 |
  \    syntax off |
  \ endif


let g:neovide_fullscreen=v:true
let g:neovide_cursor_vfx_mode = "sonicboom"
