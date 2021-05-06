" execute 'source' '~/AppData/Local/nvim/vimrc/init.vim'

let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
set encoding=utf-8
set langmenu=zh_CN
language message zh_CN.UTF-8
set fileencodings=utf-8,ucs-bom,chinese,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
filetype on         " 开启文件类型侦测
filetype plugin on  " 根据侦测到的不同类型加载对应的插件
set incsearch       " 开启实时搜索功能
set ignorecase      " 搜索时大小写不敏感
set wildmenu        " vim 自身命令行模式智能补全
set linebreak
set mouse=a         " 设置鼠标滚动
" set gcr=a:block-blinkon0   " 禁止光标闪烁
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
set confirm " 在处理未保存或只读文件的时候，弹出确认
set wrap " 自动折行
" syntax enable " 开启语法高亮功能
set synmaxcol=256 " 高亮限制前x列
syntax on     " 允许用指定语法高亮配色方案替换默认方案
" syntax sync fromstart
set secure
set redrawtime=2000
filetype indent on  " 自适应不同语言的智能缩进
set expandtab       " 将制表符扩展为空格
set tabstop=2       " 设置编辑时制表符占用空格数
set shiftwidth=2    " 设置格式化时制表符占用空格数
set softtabstop=2   " 让 vim 把连续数量的空格视为一个制表符
set foldmethod=manual   " 基于缩进或语法进行代码折叠
                        " 手动建立折叠（manual）、
                        " 基于缩进进行折叠（indent）、
                        " 基于语法进行折叠（syntax）注意插入模式容易卡顿
                        " 未更改文本构成折叠（diff）等等，
set nofoldenable       " 启动 vim 时关闭折叠代码
set foldlevelstart=99    " 打开文件默认不折叠
set fileformat=unix
set fileformats=unix,dos

set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set nowritebackup
set autoread            " 文件在vim之外修改过，自动重新读入
" set autowrite           " 设置自动保存
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
set winaltkeys=no " 设置 alt 键不映射到菜单栏
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100
set scrolljump=5
" set autochdir 自动pwd到文件当前目录
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start
set nrformats-=octal
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set fillchars=vert:│,fold:·
set hidden
set completeopt=menuone,noselect
set shortmess+=c " 禁止在下方显示一些啰嗦的提示
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
let s:fontsize = 14
let g:Powerline_symbols='unicode'
" 改变字体大小
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! " .s:fontname.":h" . s:fontsize
endfunction
noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
" 显示相对路径
" set statusline=%f
" syntax sync minlines=256
" syntax sync maxlines=500
autocmd syntax *
  \ let a=0+system("wc -L ".expand("%")."|awk '{printf $1}'") |
  \ if a >= 200 |
  \    syntax off |
  \ endif
" 使用 neovide 时
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_cursor_antialiasing=v:true

" lua require('plugins')

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'liuchengxu/vim-which-key' "显示leader快捷键
Plug 'junegunn/vim-easy-align' "代码对齐
Plug 'tpope/vim-fugitive' " git插件
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'itchyny/lightline.vim' "状态栏显示
Plug 'mgee/lightline-bufferline' "状态栏buffer快捷导航
Plug 'itchyny/vim-gitbranch'
Plug 'josa42/vim-lightline-coc'
Plug 'haya14busa/incsearch.vim' "增强/文字搜索
Plug 'sickill/vim-pasta'
Plug 'konfekt/fastfold' "性能更好的语法折叠
Plug 'tpope/vim-surround' "匹配符号快捷操作
Plug 'terryma/vim-expand-region' "扩大缩小选择区域
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'easymotion/vim-easymotion' " 基于字母的光标快速移动
Plug 'justinmk/vim-sneak' "双字母选择的光标移动
let g:sneak#label = 1
Plug 'skywind3000/vim-dict' "相当全的字典,用于默认补全
Plug 'ryanoasis/vim-devicons' " 显示文件图标
Plug 'moll/vim-node', {'for': ['javascript', 'typescript']}
if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "性能更好的语法高亮,需要night版本,建议更新完后把lua文件同步到nvim的lua目录下
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'nvim-treesitter/playground'
    Plug 'norcalli/nvim-colorizer.lua' " 颜色值显示,最好把插件内的lua文件同步到bin/lua下
    lua require'colorizer'.setup()
    Plug 'mfussenegger/nvim-dap' " debug
    " Telescope, 搜索grep工具
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'
    Plug 'glepnir/indent-guides.nvim' " 对齐线
    Plug 'windwp/nvim-autopairs'
    Plug 'phaazon/hop.nvim' " 快速字母导航
    nnoremap <Leader>W :HopWord<CR>
endif
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'],
  \ 'do': 'make install'
  \}
Plug 'Quramy/vim-js-pretty-template', { 'for': ['javascript-jsx', 'typescript-tsx'] } "高亮jsx结构
Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript-jsx', 'typescript-tsx'] } "jsx语法缩进
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" 多光标
Plug 'mg979/vim-visual-multi'
Plug 'terryma/vim-multiple-cursors'
" 主题
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'artanikin/vim-synthwave84'
Plug 'aloussase/cyberpunk'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'matze/vim-move' " 代码块移动
Plug 'alvan/vim-closetag' "自动闭合标签
Plug 'luochen1990/rainbow' "彩虹符号匹配
Plug 'ianva/vim-youdao-translater' "有道翻译
Plug 'junegunn/vim-peekaboo' "查看历史的复制和删除的寄存器, @或\" 触发
Plug 'tpope/vim-dispatch', {'on': 'Dispatch'} "异步执行make和test
Plug 'tpope/vim-eunuch' " 加强的目录和文件编辑
Plug 'mhinz/vim-hugefile'
Plug 'tpope/vim-repeat' "重复命令操作
Plug 'ntpeters/vim-better-whitespace' "显示多余空格
Plug 'mhinz/vim-startify' "启动界面预览
Plug 'kristijanhusak/vim-carbon-now-sh' "代码块生成图片
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary' "快捷代码注释
Plug 'asins/vimcdoc' "中文文档计划
set helplang=cn
Plug 'pechorin/any-jump.vim' "跳转到函数定义
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug', 'vimwiki'], 'on': 'MarkdownPreview'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
\ | Plug 'junegunn/limelight.vim', { 'for': 'markdown' } " 专注阅读
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
Plug 'uguu-org/vim-matrix-screensaver', {'on': 'Matrix'} "黑客帝国的屏保
Plug 'lfv89/vim-interestingwords' " 高亮标记单词
let g:interestingWordsRandomiseColors = 1
Plug 'thinca/vim-quickrun' " 代码执行
Plug 'christoomey/vim-conflicted'
Plug 'chrisbra/vim-diff-enhanced'
" 平滑滚动
Plug 'tpope/vim-apathy' " 加强版的 go to file
" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
Plug 'chrisbra/NrrwRgn' "专注于选定区域，而使其余区域无法访问,选择区域后:NR
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
Plug 'mbbill/undotree'
Plug 'tpope/vim-dadbod' | Plug 'kristijanhusak/vim-dadbod-ui' | Plug 'kristijanhusak/vim-dadbod-completion' " 数据库

call plug#end()

" autocmd VimEnter * PlugClean! | PlugUpdate --sync
filetype plugin indent on  " 根据侦测到的不同类型加载对应的插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
" 加载插件配置
for f in split(glob('$VIMPATH/nvim/vimrc/plugins/*.vim'), '\n')
    exe 'source' f
endfor

set t_Co=256
highlight ColorColumn ctermbg=125
if has('termguicolors')
  set termguicolors
endif
colorscheme nightfly
" colorscheme challenger_deep cyberpunk

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
cnoremap <C-l> <Right>
cnoremap <C-j> <Left>
" 使用leader q执行宏录制功能
nnoremap <leader>q q
" 去除EX模式
nmap Q <nop>
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
" 新建终端, 这里使用了powershell 7
nnoremap <leader>\ :terminal pwsh<cr>
" 浏览目录
" nnoremap <leader>e :Explore<cr>
function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction
noremap <silent> <space><space> <esc>:call common#functions#Wall()<cr>
noremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
xnoremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
noremap <silent> <space><space> <esc>:silent! write<cr>
xnoremap <silent> <space><space> <esc>:silent! write<cr>
"智能行移动
map j gj
map k gk
map j gj
map k gk
" 复制到末尾
nnoremap Y y$
nnoremap vv ^vg_
" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>
" 显示文件大小
function! GetFilesize(file)
        let size        =        getfsize(expand(a:file))
        echo 'Size of ' a:file ' is ' size ' bytes'
endfunction
map <leader>sz :call GetFilesize(@%)<CR>
inoremap jk <ESC>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"取消高亮
" map <leader>n :nohl<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
"插入模式下快速回到normal模式并且到新行
inoremap <C-O> <Esc>o
"删除buffer
nnoremap <C-x> :bd<CR>
" nnoremap <C-X> :bufdo bd<CR>
" Write buffer (save)保存
nnoremap <C-S> <esc>:w<CR>
nnoremap <C-Q> <esc>:wq<CR>
" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
inoremap <M-h> <HOME>
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

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
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

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
map <leader>sa ggVG"
nnoremap <Leader>sm :so $MYVIMRC<CR>
