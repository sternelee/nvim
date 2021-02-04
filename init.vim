" execute 'source' '~/AppData/Local/nvim/vimrc/init.vim'
" 参考: https://www.sainnhe.dev/post/status-line-config/
" gvim需要把lua53.dll放在与gvim.exe同级下
" https://yianwillis.github.io/vimcdoc/doc/quickref.html
" https://github.com/neovim/neovim/wiki/Related-projects#gui
" windows 推荐使用Nvy
" 1. 初始化
"map syntax sync fromstart
nmap tu :syntax sync fromstart<cr>

" 2. 初始配置

" let g:python3_host_prog=" 建议使用scoop install -g python
let g:python_host_skip_check=1
" let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_skip_check=1
" let g:python3_host_prog = 'C:\ProgramData\scoop\shims\python3.EXE'

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
" for f in split(glob('$VIMPATH/vimrc/plugins/*.vim'), '\n')
"     exe 'source' f
" endfor

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

" 4. 插件安装

" 环境要求nodejs(neovim), python3
" 需要使用Scoop(或chcoc)全局安装 ctags, fzf, maple, ripgrep, bat, lua
" 参考: https://zhuanlan.zhihu.com/p/348257414
" 参考: https://github.com/phaazon/config/tree/master/nvim
" 参考：https://github.com/sainnhe/dotfiles
" 参考：https://github.com/sternelee/vime
" 插件推荐: https://blog.csdn.net/weixin_31468621/article/details/112422509

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale' " 语法检测
" Plug 'sbdchd/neoformat'
" Plug 'prettier/prettier'
" Plug 'scrooloose/syntastic'
" Plug 'rust-lang/rust.vim'
" let g:rustfmt_autosave = 1
" Plug 'jayli/vim-easycomplete'
" Plug 'skywind3000/vim-auto-popmenu'

Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tpope/vim-dispatch', {'on': 'Dispatch'} "异步执行make和test
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim' " needed for previews
" Plug 'antoinemadec/coc-fzf'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" Plug 'wsdjeg/FlyGrep.vim'
Plug 'misterbuckley/vim-definitive' "搜索定义、类声明等
" 函数列表
" Plug 'preservim/tagbar'
" nmap <F8> :TagbarToggle<CR>
Plug 'liuchengxu/vista.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vim-which-key' "显示leader快捷键
Plug 'junegunn/vim-easy-align' "代码对齐
" git插件
Plug 'tpope/vim-fugitive'
\ | Plug 'rbong/vim-flog'
" \ | Plug 'mhinz/vim-signify'
\ | Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim' "状态栏显示
Plug 'mgee/lightline-bufferline' "状态栏buffer快捷导航
" Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim', { 'on': 'PomodoroStart' } "番茄时钟
Plug 'haya14busa/incsearch.vim' "增强/文字搜索
Plug 'konfekt/fastfold' "性能更好的语法折叠
" 功能很强的折叠插件, zc zo
Plug 'pseewald/vim-anyfold'
Plug 'tpope/vim-surround' "匹配符号快捷操作
Plug 'terryma/vim-expand-region' "扩大缩小选择区域
Plug 'easymotion/vim-easymotion', {'on':
   \ [
   \ '<Plug>(easymotion-bd-f)', '<Plug>(easymotion-overwin-f)',
   \ '<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-bd-jk)',
   \ '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-bd-w)',
   \ '<Plug>(easymotion-overwin-w)', '<Plug>(easymotion-s)',
   \ ]}     " 基于字母的光标快速移动
Plug 'hrsh7th/vim-eft'
Plug 'justinmk/vim-sneak' "双字母选择的光标移动
let g:sneak#label = 1
" 显示文件图标
Plug 'ryanoasis/vim-devicons'
Plug 'leafoftree/vim-vue-plugin'
Plug 'moll/vim-node', {'for': ['javascript', 'typescript']}
if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/nvim-bufferline.lua'
    " Plug 'glepnir/zephyr-nvim'
    " lua require('zephyr')
    Plug 'nvim-treesitter/nvim-treesitter' "性能更好的语法高亮,需要night版本
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'nvim-treesitter/playground'
    Plug 'kyazdani42/nvim-tree.lua'
    " Plug 'romgrk/nvim-treesitter-context'
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    " Plug 'norcalli/nvim-colorizer.lua'
    " lua require'colorizer'.setup()
    " 依赖python,在gvim下有问题
    " Plug 'yggdroot/leaderf'
    " Plug 'puremourning/vimspector' "可视化debug
    " Plug 'tadaa/vimade' " 聚焦当前操作窗口,但在%s做替换时有bug
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
    let g:Hexokinase_highlighters = ['foregroundfull']
    " Plug 'sheerun/vim-polyglot' " 多语言的代码高亮集成包, markdown语法显示有问题
    " Plug 'octol/vim-cpp-enhanced-highlight'
endif
" Plug 'mattn/emmet-vim', { 'for': 'html' } "html快捷生成代码块,已经用了coc
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}
Plug 'Quramy/vim-js-pretty-template', { 'for': ['javascript-jsx', 'typescript-tsx'] } "高亮jsx结构
Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript-jsx', 'typescript-tsx'] } "jsx语法缩进
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'janko-m/vim-test' "测试工具
" 多光标
Plug 'mg979/vim-visual-multi'
Plug 'terryma/vim-multiple-cursors'
" Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'jiangmiao/auto-pairs' "符号补全
Plug 'matze/vim-move', {'on': [
  \ '<Plug>MoveBlockDown',
  \ '<Plug>MoveBlockUp',
  \ '<Plug>MoveBlockRight',
  \ '<Plug>MoveBlockLeft']}   " 代码块移动
Plug 'rhysd/accelerated-jk' " 加速jk移动
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
Plug 'alvan/vim-closetag' "自动闭合标签
Plug 'luochen1990/rainbow' "彩虹符号匹配
" Plug 'ianva/vim-youdao-translater' "有道翻译
"Plug 'vim-scripts/YankRing.vim' "yank工具
Plug 'junegunn/vim-peekaboo' "查看历史的复制和删除的寄存器, @或\" 触发
Plug 'tpope/vim-eunuch' " 加强的目录和文件编辑
" 最大化窗口，ctrl w o
Plug 'troydm/zoomwintab.vim'
Plug 'tpope/vim-repeat' "重复命令操作
Plug 'ntpeters/vim-better-whitespace' "显示多余空格
Plug 'mhinz/vim-startify' "启动界面预览
" Plug 'glepnir/dashboard-nvim'
Plug 'yggdroot/indentline' "配置显示缩进对齐线
" Plug 'glepnir/indent-guides.nvim' " 基于lua的对齐线
Plug 'kristijanhusak/vim-carbon-now-sh' "代码块生成图片
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth' "自适应配置缓冲选项
" Plug 'nicwest/vim-http', {'on': 'Http'} "配置http请求
" Plug 'tomtom/tcomment_vim'
" Plug 'scrooloose/nerdcommenter' "快捷代码注释
Plug 'tpope/vim-commentary' "快捷代码注释
" 生成注释文档
" Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}
Plug 'asins/vimcdoc' "中文文档计划
set helplang=cn
" Plug 'jbgutierrez/vim-better-comments' "显示注释
Plug 't9md/vim-choosewin' "快捷窗口选择-
Plug 'pechorin/any-jump.vim' "跳转到函数定义
" Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' } "模糊匹配搜索器/跳跃器
" let g:aerojump_keymaps = {
"   \ "<C-t>": "AerojumpDown",
"   \ "<C-s>": "AerojumpUp",
"   \ "<Esc>": "AerojumpExit",
"   \ "<CR>": "AerojumpSelect",
"   \ }
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug', 'vimwiki'], 'on': 'MarkdownPreview'}
" Plug 'mzlogin/vim-markdown-toc'
" 专注阅读
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
\ | Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
" Plug 'gpanders/vim-medieval', {'for': 'markdown'}  "评估markdown代码块
" Plug 'rhysd/vim-grammarous', {'for': ['markdown', 'vimwiki', 'md', 'tex']}
" Plug 'jceb/vim-orgmode'
" let g:org_agenda_files = ['~/org/index.org']
" let g:org_aggressive_conceal = 1
" let g:org_heading_shade_leading_stars = 1
" let g:org_todo_keywords = ['TODO', 'WIP', 'REVIEW', '|', 'DONE', 'CANCELLED']
" let g:org_indent = 1
Plug 'uguu-org/vim-matrix-screensaver', {'on': 'Matrix'} "黑客帝国的屏保
" Plug 'metakirby5/codi.vim', {'on': 'Codi'} "代码执行预览
Plug 'skywind3000/asynctasks.vim' "任务
Plug 'skywind3000/asyncrun.vim'
Plug 'christoomey/vim-conflicted'
Plug 'chrisbra/vim-diff-enhanced'
" Plug 'tommcdo/vim-exchange'
" Plug 'brooth/far.vim' " 全局替换插件
Plug 'markonm/traces.vim'
Plug 'neomake/neomake'
Plug 'tracyone/neomake-multiprocess'
"autodetect the existence of commands and select the faster one(rg > ag > grep)
let g:neomakemp_grep_command = "rg"
"following is default value
let g:neomakemp_exclude_files=['*.jpg', '*.png', '*.min.js', '*.swp', '*.pyc','*.out','*.o']
let g:neomakemp_exclude_dirs=[ '.git', 'bin', 'log', 'build', 'node_modules', '.bundle', '.tmp','.svn' ]
Plug 'ronakg/quickr-preview.vim'
" 关闭buffer而不关闭窗口
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" 平滑滚动
" Plug 'psliwka/vim-smoothie'
" 加强版的 go to file
Plug 'tpope/vim-apathy'
" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
" Plug 'andrewradev/linediff.vim' "行代码的对比
" Plug 'valloric/matchtagalways'
" Plug 'andymass/vim-matchup' " 高亮匹配语句
" Plug 'tpope/vim-characterize' "ga显示光标下 Unicode 字符的名称、代码点值和十六进制值
" Plug 'stefandtw/quickfix-reflector.vim'
" Plug 'machakann/vim-swap' "交换参数, g>或g<
" Plug 'vimwiki/vimwiki'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'kana/vim-textobj-user'
" Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']} " 悬浮终端
" Plug 'danilamihailov/beacon.nvim' "看到你的跳转
" Plug 'lifepillar/vim-mucomplete' "链式的极简自动完成
Plug 'chrisbra/NrrwRgn' "专注于选定区域，而使其余区域无法访问,选择区域后:NR
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
" Plug 'inkarkat/vim-SyntaxRange'
" 数据库
" Plug 'tpope/vim-dadbod' | Plug 'kristijanhusak/vim-dadbod-ui' | Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'tpope/vim-sensible' "合适的默认配置
Plug 'tpope/vim-unimpaired' "符号映射
Plug 'tpope/vim-scriptease'
" tmux相关插件
if executable("tmux") && strlen($TMUX)
    " tmux与vim窗口间导航
    Plug 'christoomey/vim-tmux-navigator'
    " tmux.conf set -g focus-events on
    Plug 'tmux-plugins/vim-tmux-focus-events'
    " 在tmux和vim之间进行复制与粘贴
    Plug 'roxma/vim-tmux-clipboard'
    " tmux补全插件
    Plug 'wellle/tmux-complete.vim'
endif

call plug#end()

" autocmd VimEnter * PlugClean! | PlugUpdate --sync

filetype plugin indent on  " 根据侦测到的不同类型加载对应的插件
set completeopt=longest,preview,menu " 代码补全
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 插件配置
let g:any_jump_disable_default_keybindings = 1
" Normal mode: Jump to definition under cursore
nnoremap <leader>aj :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>aj :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

nmap - <Plug>(choosewin)

" :call clap#installer#build_maple()
 nnoremap <Leader>c :Clap<Cr>
 nnoremap <Leader>cb :Clap buffers<Cr>
 nnoremap <Leader>cf :Clap files<Cr>
 nnoremap <Leader>ce :Clap filer<Cr>
 nnoremap <Leader>cg :Clap grep<Cr>
 nnoremap <Leader>G :Clap grep2<Cr>
 let g:clap_insert_mode_only = v:true
 let g:clap_current_selection_sign = { 'text': '->', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
 let g:clap_selected_sign = { 'text': ' ·', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
 let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!node_modules/"'

 let g:clap_fuzzy_match_hl_groups = [
			 \ [118 , '#9922ff'] ,
			 \ [82  , '#a236ff'] ,
			 \ [46  , '#ab49ff'] ,
			 \ [48  , '#bd70ff'] ,
			 \ [49  , '#c684ff'] ,
			 \ [50  , '#f287ca'] ,
			 \ [51  , '#f075c3'] ,
			 \ [87  , '#ef63bb'] ,
			 \ [123 , '#ed51b3'] ,
			 \ [159 , '#eb40ab'] ,
			 \ [195 , '#e92ea4'] ,
			 \ ]

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.js,*.jsx,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.js'
let g:closetag_emptyTags_caseSensitive = 1

" 使用文档： https://openbase.io/js/coc.nvim
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
  \ 'coc-explorer'
  \ ]

" from readme
" if hidden is not set, TextEdit might fail.
" set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

nmap <space>e :CocCommand explorer<CR>

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
" autocmd CursorHold * silent call CocActionAsync('highlight')

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" better color for coc hints
" au Colorscheme * call OverrideCocHighlights()

function OverrideCocHighlights()
  hi! CocRustChainingHint NONE
  hi! link CocRustChainingHint Comment
endfunction


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>E  :<C-u>CocList extensions<cr>
" Show commands
 nnoremap <silent> <space>C  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>N  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>P  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>R  :<C-u>CocListResume<CR>

" Use K to show documentation in preview window
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

" grep current word in current buffer
" nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

let g:rust_recommended_style = 0

nnoremap <silent> <space>f  :<C-u>CocList files<cr>
nnoremap <silent> <space>g  :<C-u>CocList grep<cr>
nnoremap <silent> <space>b  :<C-u>CocList buffers<cr>
command! -nargs=0 Format :CocCommand prettier.formatFile
" popup
nmap <Leader>ct <Plug>(coc-translator-p)
vmap <Leader>ct <Plug>(coc-translator-pv)

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_keys = 'bpovdljzwxyqghfknarusite'
let g:EasyMotion_do_mapping = 0
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" <Leader>f{char} to move to {char}
map  <Leader>ef <Plug>(easymotion-bd-f)
nmap <Leader>ef <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:indentline_leadingspaceenable=1
let g:indentline_char='|'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentline_filetypeexclude = ['startify']

" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_ShortcutF = '<A-z>`````ff'
" let g:Lf_ShortcutB = '<A-z>`````ff'
" let g:Lf_WindowHeight = 0.4
" let g:Lf_ShowRelativePath = 0
" let g:Lf_CursorBlink = 1
" let g:Lf_CacheDirectory = expand('~/.cache/vim/leaderf')
" let g:Lf_StlSeparator = { 'left': '', 'right': '' }
" let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.vscode']
" let g:Lf_ShowHidden = 1
" let g:Lf_ReverseOrder = 1
" let g:Lf_PreviewHorizontalPosition = 'center'
" " let g:Lf_StlColorscheme = 'gruvbox_material'
" " let g:Lf_PopupColorscheme = 'gruvbox_material'
" let g:Lf_PreviewResult = {
"       \ 'File': 0,
"       \ 'Buffer': 0,
"       \ 'Mru': 0,
"       \ 'Tag': 0,
"       \ 'BufTag': 0,
"       \ 'Function': 0,
"       \ 'Line': 0,
"       \ 'Colorscheme': 0,
"       \ 'Rg': 0,
"       \ 'Gtags': 0
"       \}
" let g:Lf_WildIgnore = {
"       \ 'dir': ['.svn','.git','.hg', '.vscode', 'node_modules', 'dist'],
"       \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
"       \}
" let g:Lf_RgConfig = [
"       \ '--glob=!\.git/*',
"       \ '--glob=!\.vscode/*',
"       \ '--glob=!dist/*',
"       \ '--glob=!node_modules/*',
"       \ '--glob=!\.svn/*',
"       \ '--glob=!\.hg/*',
"       \ '--case-sensitive',
"       \ has('win32') ? '--crlf' : '--no-crlf',
"       \ '--multiline',
"       \ '--hidden'
"       \ ]
" map <leader>f :LeaderfFile<CR>
" map <leader>u :LeaderfFunction<CR>
" map <leader>b :LeaderfBuffer<CR>
" map <leader>g :Leaderf rg<CR>
" map <leader>lc :LeaderfColorscheme<CR>
" " map <leader>gg :Leaderf gtags<CR>

" "" search word under cursor, the pattern is treated as regex, and enter normal mode directly
" noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

"" search wxnoremapnoremaord under cureat as regex,
"" append the result to previous search results.
"" noremap <leader>fg :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>

"" search word under cursor literally only in current buffer
"noremap <leader>ff :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>

"" search word under cursor literally in all listed buffers
""noremap <C-D> :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ", expand("<cword>"))<CR>

"" search visually selected text literally, don't quit LeaderF after accepting an entry
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>

"" recall last search. If the result window is closed, reopen it.
" noremap <leader>fo :<C-U>Leaderf! rg --recall<CR>


"" search word under cursor in *.h and *.cpp files.
""noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp", expand("<cword>"))<CR>
"" the same as above
""noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,cpp}", expand("<cword>"))<CR>

"" search word under cursor in cpp and java files.
""noremap <Leader>b :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -t java", expand("<cword>"))<CR>

"" search word under cursor in cpp files, exclude the *.hpp files
""noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*.hpp", expand("<cword>"))<CR>

"let g:Lf_GtagsAutoGenerate = 0
"let g:Lf_Gtagslabel = 'native-pygments'
"noremap <leader>gr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>gd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>go :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" scriptencoding utf-8

" 書き方は以下を参照
" * https://github.com/Yggdroot/LeaderF/issues/144#issuecomment-540008950
" * http://bit.ly/2NdiX1x

" :Leaderf packadd
" :Leaderf git_checkout
" :Leaderf mrw
" :Leaderf todo

" let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})

" ============================================================================
" packadd
" function! LfExt_packadd_source(args) abort
"     let l:result = []
"     for path in split(globpath(&packpath, '/pack/*/opt/*'))
"         if isdirectory(path)
"             call add(l:result, fnamemodify(path, ':t'))
"         endif
"     endfor
"     return l:result
" endfunction

" function! LfExt_packadd_accept(line, args) abort
"     execute 'packadd '.a:line
" endfunction

" let g:Lf_Extensions.packadd = {
" \   'source': 'LfExt_packadd_source',
" \   'accept': 'LfExt_packadd_accept',
" \}
" command! Tpackadd Leaderf packadd
" " ============================================================================

" " ============================================================================
" " git checkout
" function! LfExt_git_checkout_source(args) abort
"     let l:source = filter(systemlist('git branch'), 'v:val[0] !=# "*"')
"     if empty(source)
"         echohl ErrorMsg
"         echo 'no other branch'
"         echohl None
"         return []
"     endif
"     return l:source
" endfunction

" function! LfExt_git_checkout_accept(line, args) abort
"     call system('git checkout ' . a:line)
" endfunction

" let g:Lf_Extensions.git_checkout = {
" \   'source': 'LfExt_git_checkout_source',
" \   'accept': 'LfExt_git_checkout_accept',
" \}
" command! LfGitCheckout Leaderf git_checkout --popup
" ============================================================================

" ============================================================================
" mrw
" function! LfExt_mrw_source(args) abort
"     let l:files = mrw#read_cachefile(expand('%'))
"     let l:result = []
"     " from mrw.vim
"     let l:max_filename_len = max(map(copy(l:files), {i,x -> strdisplaywidth(fnamemodify(x, ':p:t'))}) + [0])
"     for l:file in l:files
"         let l:name = fnamemodify(l:file, ':p:t')
"         let l:space = l:max_filename_len - strdisplaywidth(l:name)
"         call add(l:result, printf('%s%s "%s"', l:name, repeat(' ', l:space), fnamemodify(l:file, ':p:h')))
"     endfor
"     return l:result
" endfunction

" function! LfExt_mrw_get_digest(line, mode) abort
"     if a:mode ==# 0
"         return [a:line, 0]
"     elseif a:mode ==# 1
"         let l:end = stridx(a:line, ' ')
"         return [a:line[:l:end-1], 0]
"     else
"         let l:start = stridx(a:line, ' "')
"         return [a:line[l:start+2: -1], strlen(a:line) - 1]
"     endif
" endfunction

" function! LfExt_mrw_accept(line, args) abort
"     let l:path = LfExt_mrw_get_digest(a:line, 2)[0][:-2]
"     \           . '/'
"     \           . LfExt_mrw_get_digest(a:line, 1)[0]
"     exec 'drop ' . l:path
" endfunction

" let g:Lf_Extensions.mrw = {
" \   'source': 'LfExt_mrw_source',
" \   'accept': 'LfExt_mrw_accept',
" \   'get_digest': 'LfExt_mrw_get_digest',
" \   'supports_name_only': 1,
" \}
" ============================================================================

" ============================================================================
" todo
" let s:todo_dict = {
" \   'cancel':           'call todo#ToggleMarkAsDone("Cancelled")',
" \   'done':             'call todo#ToggleMarkAsDone("")',
" \   'remove_complete':  'call todo#RemoveCompleted()',
" \   'add_due':          "normal! A due:\<C-R>=strftime('%Y-%m-%d')\<CR>\<Esc>0"
" \}

" function! LfExt_todo_source(args) abort
"     return keys(s:todo_dict)
" endfunction

" function! LfExt_todo_accept(line, args) abort
"     silent execute s:todo_dict[a:line]
" endfunction

" let g:Lf_Extensions.todo = {
" \   'source': 'LfExt_todo_source',
" \   'accept': 'LfExt_todo_accept',
" \}
" ============================================================================

let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ ['homemode'], ['method'],
      \             ['gitbranch', 'gitgutter'],['cocerror'],['cocwarn']],
      \   'right':[ ['lineinfo'],
      \             ['percent'], ['fileformat','fileencoding'] , ['asyncrun_status'], ['neomake_status']],
      \ },
      \ 'inactive': {
      \   'left': [['homemode'], ['gitbranch'], ['gitgutter']],
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
      \   'cocerror': 'LightLineCocError',
      \   'cocwarn' : 'LightLineCocWarn',
      \   'asyncrun_status': 'lightline#asyncrun#status',
      \   'neomake_status': 'neomakemp#run_status()'
      \ },
      \ 'component_function': {
      \   'homemode': 'LightlineMode',
      \   'gitgutter': 'LightLineGitGutter',
      \   'gitbranch': 'gitbranch#name',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ 'component_type': {'buffers': 'tabsel'},
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"}
      \ }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"
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

function! LightLineCocError()
  let error_sign = get(g:, 'coc_status_error_sign', has('mac') ? 'X' : 'E')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    call add(errmsgs, error_sign . info['error'])
  endif
  return trim(join(errmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! LightLineCocWarn() abort
  let warning_sign = get(g:, 'coc_status_warning_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let warnmsgs = []
  if get(info, 'warning', 0)
    call add(warnmsgs, warning_sign . info['warning'])
  endif
  return trim(join(warnmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

autocmd User CocDiagnosticChange call lightline#update()

function! LightLineGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = ['+','~','-']
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

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

map <leader>mi :Matrix<CR>

"autodetect the existence of commands and select the faster one(rg > ag > grep)
let g:neomakemp_grep_command = "rg"
"following is default value
let g:neomakemp_exclude_files=['*.jpg', '*.png', '*.min.js', '*.swp', '*.pyc','*.out','*.o']
let g:neomakemp_exclude_dirs=[ '.git', 'bin', 'log', 'build', 'node_modules', '.bundle', '.tmp','.svn' ]
"search words on current cursor.
nmap <Leader>ng <Plug>(neomakemp_global_search)
"run commands from user input
nmap <Leader>nr <Plug>(neomakemp_run_command)
"search words from user input(regular expression)
nmap <Leader>nG <Plug>(neomakemp_global_search2)
"search word on current cursor in exist buffers
nmap <Leaderf>nb <Plug>(neomakemp_global_search_buf)
"search word in current file
nmap <Leaderf>nf <Plug>(neomakemp_global_search_cur_file)

" For startify
let g:startify_padding_left = 4
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 5
let g:startify_update_oldfiles = 1
let g:startify_session_delete_buffers = 1 " delete all buffers when loading or closing a session, ignore unsaved buffers
let g:startify_change_to_dir = 1 " when opening a file or bookmark, change to its directory
let g:startify_fortune_use_unicode = 1 " beautiful symbols
let g:startify_padding_left = 3 " the number of spaces used for left padding
let g:startify_session_remove_lines = ['setlocal', 'winheight'] " lines matching any of the patterns in this list, will be removed from the session file
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time
let g:startify_custom_indices = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'] " MRU indices
" line 579 for more details
if has('nvim')
  let g:startify_commands = [
        \ {'c': 'CocList'},
        \ {'t': 'terminal'},
        \ ]
endif
let g:startify_padding_left = 4
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

" costom startify list
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [" \ue62e Sessions"]       },
      \ { 'type': 'bookmarks', 'header': [" \uf5c2 Bookmarks"]      },
      \ { 'type': 'files',     'header': [" \ufa1eMRU Files"]            },
      \ { 'type': 'dir',       'header': [" \ufa1eMRU Files in ". getcwd()] },
      \ { 'type': 'commands',  'header': [" \ufb32 Commands"]       },
      \ ]
" MRU skipped list, do not use ~
let g:startify_skiplist = [
      \ '/mnt/*',
      \ ]
function ExplorerStartify()
  execute 'Startify'
  " execute 'call ToggleCocExplorer()'
endfunction
function! s:startify_mappings() abort
  nmap <silent><buffer> o <CR>
  nmap <silent><buffer> h :wincmd h<CR>
  nmap <silent><buffer> <Tab> :CocList project<CR>
endfunction
" augroup startifyCustom
"   autocmd!
"   autocmd VimEnter *
"         \   if !argc()
"         \ |   call ExplorerStartify()
"         \ | endif
"   autocmd FileType startify call s:startify_mappings()
"   " on Enter
"   " autocmd User Startified nmap <silent><buffer> <CR> <plug>(startify-open-buffers):call ToggleCocExplorer()<CR>
" augroup END

nnoremap <Leader>H :Startify<Cr>

" let test#strategy = "dispatch"

" vista.vim
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" By default vista.vim never run if you don't call it explicitly.
let g:vista_default_executive = 'ctags'
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"autocmd FileType vue syntax sync fromstart
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" for vim-vue-plugin
let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_use_scss = 1
let g:vim_vue_plugin_has_init_indent = 1
let g:vim_vue_plugin_highlight_vue_attr = 1
let g:vim_vue_plugin_highlight_vue_keyword = 1
let g:vim_vue_plugin_use_foldexpr = 1

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

" Whitespace utilities

" Remove end of line white space
command! -range=% WhitespaceErase call <SID>WhitespaceErase(<line1>,<line2>)

" Whitespace events
if v:version >= 702
	augroup WhitespaceMatch
		autocmd!
		autocmd InsertEnter * call <SID>ToggleWhitespace('i')
		autocmd InsertLeave * call <SID>ToggleWhitespace('n')
	augroup END
endif

function! s:ToggleWhitespace(mode)
	if &buftype =~? 'nofile\|help\|quickfix' || &filetype ==? ''
		return
	elseif a:mode ==? ''
		call matchdelete(w:whitespace_match_id)
		return
	else
		let l:pattern = (a:mode ==# 'i') ? '\s\+\%#\@<!$' : '\s\+$\| \+\ze\t'
		if exists('w:whitespace_match_id')
			call matchdelete(w:whitespace_match_id)
			call matchadd('ExtraWhitespace', l:pattern, 10, w:whitespace_match_id)
		else
			highlight! link ExtraWhitespace  SpellBad
			let w:whitespace_match_id = matchadd('ExtraWhitespace', l:pattern)
		endif
	endif
endfunction

function! s:WhitespaceErase(line1, line2)
	let l:save_cursor = getpos('.')
	silent! execute ':'.a:line1.','.a:line2.'s/\s\+$//'
	call setpos('.', l:save_cursor)
endfunction

" vim: set ts=2 sw=2 tw=80 noet :
" Theme
" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
	set termguicolors
endif

colorscheme challenger_deep
" colorscheme cyberpunk-neon
hi Comment cterm=italic

highlight Comment cterm=italic gui=italic
