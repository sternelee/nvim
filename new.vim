
"{{{Basic
"{{{BasicConfig
set runtimepath-=/usr/share/vim/vimfiles
"if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
"  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"endif
if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:vim_is_in_tmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  let g:vim_is_in_tmux = 0
endif
if exists('g:vim_man_pager')
  let g:vim_enable_startify = 0
else
  let g:vim_enable_startify = 1
endif
" execute 'source '.expand('~/.config/nvim/env.vim')
"}}}
"FVim{{{
if exists('g:fvim_loaded')
  FVimCursorSmoothMove v:true
  FVimCursorSmoothBlink v:true
  FVimCustomTitleBar v:true
  FVimFontLigature v:true
  FVimFontNoBuiltinSymbols v:true
  FVimFontAutoSnap v:true
  FVimUIPopupMenu v:false
  FVimToggleFullScreen
endif
"}}}
"Neovide{{{
let g:neovide_cursor_vfx_mode = 'torpedo'
let g:neovide_fullscreen = v:true
"}}}
"}}}
"{{{Global
"{{{Function
"{{{s:close_on_last_tab
function! s:close_on_last_tab()
  if tabpagenr('$') == 1
    execute 'windo bd'
    execute 'q'
  elseif tabpagenr('$') > 1
    execute 'windo bd'
  endif
endfunction
"}}}
"{{{s:go_indent
" gi, gI跳转indent
function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction
function! s:go_indent(times, dir)
  for _ in range(a:times)
    let l = line('.')
    let x = line('$')
    let i = s:indent_len(getline(l))
    let e = empty(getline(l))

    while l >= 1 && l <= x
      let line = getline(l + a:dir)
      let l += a:dir
      if s:indent_len(line) != i || empty(line) != e
        break
      endif
    endwhile
    let l = min([max([1, l]), x])
    execute 'normal! '. l .'G^'
  endfor
endfunction
nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> gI :<c-u>call <SID>go_indent(v:count1, -1)<cr>
"}}}
"{{{s:get_highlight
function! s:get_highlight()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
"{{{s:local_vimrc
" Apply `.settings.vim`
function! s:local_vimrc(dirname)
  " Don't try to walk a remote directory tree -- takes too long, too many
  " what if's
  let l:netrwProtocol = strpart(a:dirname, 0, stridx(a:dirname, '://'))
  if l:netrwProtocol !=# ''
    return
  endif

  " Convert windows paths to unix style (they still work)
  let l:curDir = substitute(a:dirname, "\\", '/', 'g')

  " Walk up to the top of the directory tree
  let l:parentDir = strpart(l:curDir, 0, strridx(l:curDir, '/'))
  if isdirectory(l:parentDir)
    call s:local_vimrc(l:parentDir)
  endif

  " Now walk back down the path and source .settings.vim as you find them. This
  " way child directories can 'inherit' from their parents
  let l:settingsFile = a:dirname . '/.settings.vim'
  if filereadable(l:settingsFile)
    exec ':source ' . l:settingsFile
  endif
endfunction
augroup LocalSettings
  autocmd!
  autocmd! BufEnter * call s:local_vimrc(expand("<afile>:p:h"))
augroup END
"}}}
"}}}
"{{{Setting
set encoding=utf-8 nobomb
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set fileformats=unix,dos,mac
scriptencoding utf-8
let g:mapleader = "\<Space>"
let g:maplocalleader = "\<A-z>"
nnoremap <SPACE> <Nop>
set number cursorline
set relativenumber " 显示相对行号
set noshowmode
set incsearch
set mouse=a
filetype plugin indent on
set t_Co=256
syntax enable                           " 开启语法支持
if has('termguicolors')
  set termguicolors                       " 开启GUI颜色支持
endif
set smartindent                         " 智能缩进
set nohlsearch                          " 禁用高亮搜索
set undofile                            " 始终保留undo文件
set undodir=$HOME/.cache/vim/undo       " 设置undo文件的目录
set timeoutlen=500                      " 超时时间为 0.5 秒
set foldmethod=marker                   " 折叠方式为按照marker折叠
set hidden                              " buffer自动隐藏
set showtabline=2                       " 总是显示标签
set scrolloff=5                         " 保持5行
set viminfo='1000                       " 文件历史个数
set autoindent                          " 自动对齐
set wildmenu                            " 命令框Tab呼出菜单
set autoread                            " 自动加载变更文件
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab     " tab设定，:retab 使文件中的TAB匹配当前设置
set signcolumn=yes
set updatetime=100
set sessionoptions+=globals
if &history < 1000
  set history=1000
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
if has('nvim')
  set inccommand=split
  set wildoptions=pum
  " set pumblend=15
endif
augroup vimSettings
  autocmd!
  autocmd FileType html,css,scss,typescript set shiftwidth=2
  autocmd VimLeave * set guicursor=a:ver25-Cursor/lCursor
augroup END
"}}}
"{{{Mapping
"{{{VIM-Compatible
" sed -n l
if !has('nvim')
  execute "set <M-a>=\ea"
  execute "set <M-b>=\eb"
  execute "set <M-c>=\ec"
  execute "set <M-d>=\ed"
  execute "set <M-e>=\ee"
  execute "set <M-f>=\ef"
  execute "set <M-g>=\eg"
  execute "set <M-h>=\eh"
  execute "set <M-i>=\ei"
  execute "set <M-j>=\ej"
  execute "set <M-k>=\ek"
  execute "set <M-l>=\el"
  execute "set <M-m>=\em"
  execute "set <M-n>=\en"
  execute "set <M-o>=\eo"
  execute "set <M-p>=\ep"
  execute "set <M-q>=\eq"
  execute "set <M-r>=\er"
  execute "set <M-s>=\es"
  execute "set <M-t>=\et"
  execute "set <M-u>=\eu"
  execute "set <M-v>=\ev"
  execute "set <M-w>=\ew"
  execute "set <M-x>=\ex"
  execute "set <M-y>=\ey"
  execute "set <M-z>=\ez"
  execute "set <M-,>=\e,"
  execute "set <M-.>=\e."
  execute "set <M-->=\e-"
  execute "set <M-=>=\e="
endif
"}}}
"{{{NormalMode
" Alt+X进入普通模式
nnoremap <A-x> <ESC>
if !has('nvim')
  nnoremap ^@ <ESC>
else
  nnoremap <silent> <C-l> :<C-u>wincmd p<CR>
endif
" ; 绑定到 :
nnoremap ; :
" q 绑定到:q
nmap <silent> q :q<CR>
" <leader>q 关闭 quickfix list
nnoremap <silent> <leader>q :cclose<CR>
" m 绑定到 q
nnoremap m q
" Ctrl+S保存文件
nnoremap <silent> <C-S> :<C-u>w<CR>
" Shift+HJKL快速移动
nnoremap K 7<up>
nnoremap J 7<down>
nnoremap H 0
nnoremap L $
" Shift加方向键加速移动
nnoremap <S-up> <Esc>7<up>
nnoremap <S-down> <Esc>7<down>
nnoremap <S-left> <Esc>0
nnoremap <S-right> <Esc>$
" x删除字符但不保存到剪切板
nnoremap x "_x
" Ctrl+X剪切当前行但不保存到剪切板
nnoremap <C-X> <ESC>"_dd
" <leader>+Y复制到系统剪切板
nnoremap <leader>y "+y
" <leader>+P从系统剪切板粘贴
nnoremap <leader>p "+p
" Alt+T新建tab
nnoremap <silent> <A-t> :<C-u>tabnew<CR>:call ExplorerStartify()<CR>
" Alt+W关闭当前标签
nnoremap <silent> <A-w> :<C-u>call <SID>close_on_last_tab()<CR>
" Alt+上下左右可以跳转和移动窗口
nnoremap <A-left> <Esc>gT
nnoremap <A-right> <Esc>gt
nnoremap <silent> <A-up> :<C-u>tabm -1<CR>
nnoremap <silent> <A-down> :<C-u>tabm +1<CR>
" Alt+h j k l可以在窗口之间跳转
nnoremap <silent> <A-h> :<C-u>wincmd h<CR>
nnoremap <silent> <A-l> :<C-u>wincmd l<CR>
nnoremap <silent> <A-k> :<C-u>wincmd k<CR>
nnoremap <silent> <A-j> :<C-u>wincmd j<CR>
" Alt+V && Alt+S新建窗口
nnoremap <silent> <A-v> :<C-u>vsp<CR>
nnoremap <silent> <A-s> :<C-u>sp<CR>
" neovim下，Alt+Shift+V, Alt+Shift+S分别切换到垂直和水平分割
if has('nvim')
  nnoremap <silent> <A-V> :<C-u>wincmd t<CR>:wincmd H<CR>
  nnoremap <silent> <A-S> :<C-u>wincmd t<CR>:wincmd K<CR>
endif
" Alt+-<>调整窗口大小
nnoremap <silent> <A-=> :<C-u>wincmd +<CR>
nnoremap <silent> <A--> :<C-u>wincmd -<CR>
nnoremap <silent> <A-,> :<C-u>wincmd <<CR>
nnoremap <silent> <A-.> :<C-u>wincmd ><CR>
" z+方向键快速跳转
nnoremap z<left> zk
nnoremap z<right> zj
nnoremap z<up> [z
nnoremap z<down> ]z
" z+hjkl快速跳转
nnoremap zh zk
nnoremap zl zj
nnoremap zj ]z
nnoremap zk [z
" zo递归局部打开折叠，zc递归局部关闭折叠
nnoremap zo zO
nnoremap zc zC
" zO递归全局打开折叠，C递归全局关闭折叠
nnoremap zO zR
nnoremap zC zM
" zf创建新的折叠，zd删除当前折叠
nnoremap zf zf
nnoremap zd zd
" zn创建新的折叠，并yard当前行的内容
nmap zn $vbda<Space><CR><Space><CR><Space><ESC>v<up><up>zfa<Backspace><down><right><Backspace><down><right><Backspace><up><up><Esc>A
" zs保存折叠视图，zl加载折叠视图
nnoremap zs :<C-u>mkview<CR>
nnoremap zl :<C-u>loadview<CR>
" 获取当前光标下的高亮组
nnoremap <leader><Space>h :call <SID>get_highlight()<CR>
"}}}
"{{{InsertMode
" Alt+X进入普通模式
inoremap <A-x> <ESC><right>
if !has('nvim')
  inoremap ^@ <ESC>
endif
" Ctrl+V粘贴
inoremap <C-V> <Space><Backspace><ESC>pa
" <A-z><C-v>从系统剪切板粘贴
inoremap <A-z><C-V> <Space><Backspace><ESC>"+pa
" Ctrl+S保存文件
inoremap <silent> <C-S> <Esc>:w<CR>a
" Ctrl+O跳转
inoremap <C-o> <Esc><C-o>i
" Ctrl+Z撤销上一个动作
" Ctrl+R撤销撤销的动作
inoremap <C-R> <ESC><C-R>i
" Ctrl+X剪切当前行但不保存到剪切板
inoremap <C-X> <ESC>"_ddi
" Ctrl+hjkl移动
inoremap <C-h> <left>
inoremap <C-l> <right>
" Shift加方向键加速移动
inoremap <S-up> <up><up><up><up><up>
inoremap <S-down> <down><down><down><down><down>
inoremap <S-left> <ESC>I
inoremap <S-right> <ESC>A
" Ctrl + e/w/b
inoremap <C-e> <ESC>ea
inoremap <C-w> <ESC>lwi
inoremap <C-b> <ESC>lbi
" Alt+上下左右可以跳转和移动窗口
inoremap <silent> <A-left> <Esc>:wincmd h<CR>i
inoremap <silent> <A-right> <Esc>:wincmd l<CR>i
inoremap <silent> <A-up> <Esc>:tabm -1<CR>i
inoremap <silent> <A-down> <Esc>:tabm +1<CR>i
"}}}
"{{{VisualMode
" Alt+X进入普通模式
vnoremap <A-x> <ESC>
snoremap <A-x> <ESC>
if !has('nvim')
  vnoremap ^@ <ESC>
endif
" ; 绑定到 :
vnoremap ; :
" Ctrl+S保存文件
vnoremap <silent> <C-S> :<C-u>w<CR>v
" x删除字符但不保存到剪切板
vnoremap x "_x
" Shift+方向键快速移动
vnoremap <S-up> <up><up><up><up><up>
vnoremap <S-down> <down><down><down><down><down>
vnoremap <S-left> 0
vnoremap <S-right> $<left>
" Shift+HJKL快速移动
vnoremap K 5<up>
vnoremap J 5<down>
vnoremap H 0
vnoremap L $h
" <leader>+Y复制到系统剪切板
vnoremap <leader>y "+y
" <leader>+P从系统剪切板粘贴
vnoremap <leader>p "+p
"}}}
"{{{CommandMode
" Alt+X进入普通模式
cmap <A-x> <ESC>
if !has('nvim')
  cmap ^@ <ESC>
endif
" Ctrl+S保存
cmap <C-S> :<C-u>w<CR>
"}}}
"{{{TerminalMode
if has('nvim')
  " Alt+X进入普通模式
  tnoremap <A-x> <C-\><C-n>
  " Shift+方向键加速移动
  tnoremap <S-left> <C-a>
  tnoremap <S-right> <C-e>
endif
"}}}
"}}}
"{{{Command
" Q强制退出
command Q q!
"}}}
"}}}
"{{{Plugin
"{{{init
augroup vimPlugMappings
  autocmd!
  autocmd FileType vim-plug nmap <buffer> ? <plug>(plug-preview)
  autocmd FileType vim-plug nnoremap <buffer> <silent> h :call <sid>plug_doc()<cr>
  autocmd FileType vim-plug nnoremap <buffer> <silent> <Tab> :call <sid>plug_gx()<cr>
augroup END

function! s:plug_doc()
  let name = matchstr(getline('.'), '^- \zs\S\+\ze:')
  if has_key(g:plugs, name)
    for doc in split(globpath(g:plugs[name].dir, 'doc/*.txt'), '\n')
      execute 'tabe' doc
    endfor
  endif
endfunction

function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
        \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~# 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
        \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction
augroup PlugGx
  autocmd!
augroup END

function! s:scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
    wincmd p
  endif
endfunction
function! s:setup_extra_keys()
  nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
  nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
  nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
  nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
  nmap <silent> <buffer> <c-j> <c-n>o
  nmap <silent> <buffer> <c-k> <c-p>o
endfunction
augroup PlugDiffExtra
  autocmd!
  autocmd FileType vim-plug call s:setup_extra_keys()
augroup END

command PU PlugUpdate | PlugUpgrade | CocUpdate

call plug#begin('~/.vim/plugged')
if !has('nvim') && has('python3')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
"}}}
"{{{syntax
" Plug 'nvim-treesitter/nvim-treesitter' "性能更好的语法高亮
" Plug 'nvim-treesitter/nvim-treesitter-refactor'
" Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
Plug 'sheerun/vim-polyglot', {'as': 'vim-syntax'} "多语言的代码高亮集成包
Plug 'leafoftree/vim-vue-plugin'
let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_use_scss = 1
let g:vim_vue_plugin_has_init_indent = 1
let g:vim_vue_plugin_highlight_vue_attr = 1
let g:vim_vue_plugin_highlight_vue_keyword = 1
let g:vim_vue_plugin_use_foldexpr = 1
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'bfrg/vim-cpp-modern', {'as': 'vim-syntax-c-cpp', 'for': ['c', 'cpp']}
Plug 'maxmellon/vim-jsx-pretty', {'as': 'vim-syntax-jsx', 'for': ['javascriptreact']}
let g:polyglot_disabled = ['c', 'cpp', 'markdown', 'javascriptreact']
let g:vim_json_syntax_conceal = 0
let g:markdown_fenced_languages = [
      \   'html',
      \   'css',
      \   'scss',
      \   'sass=scss',
      \   'js=javascript',
      \   'jsx=javascriptreact',
      \   'ts=typescript',
      \   'tsx=typescript.tsx',
      \   'c',
      \   'cpp',
      \   'cs',
      \   'java',
      \   'py=python',
      \   'python',
      \   'go',
      \   'rust',
      \   'rs=rust',
      \   'php',
      \   'sh',
      \   'shell=sh',
      \   'bash=sh',
      \   'vim',
      \   'sql',
      \   'json',
      \   'yaml',
      \   'toml'
      \   ]
"}}}
" User Interface
"{{{themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
"}}}
Plug 'itchyny/lightline.vim' "状态栏显示
Plug 'mgee/lightline-bufferline' "状态栏buffer快捷导航
Plug 'itchyny/vim-gitbranch'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim'
if g:vim_is_in_tmux == 1 && !has('win32')
  Plug 'sainnhe/tmuxline.vim', {'on': ['Tmuxline', 'TmuxlineSnapshot']}
endif
if g:vim_enable_startify == 1
  Plug 'mhinz/vim-startify'
endif
Plug 'norcalli/nvim-colorizer.lua'
Plug 'liuchengxu/vim-which-key'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'junegunn/limelight.vim', {'on': 'Limelight!!'}
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'roman/golden-ratio'
Plug 'sainnhe/artify.vim'

" Productivity
if !has('win32')
  Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
  Plug 'wellle/tmux-complete.vim', {'for': 'tmux'}
  Plug 'tjdevries/coc-zsh'
  Plug 'lambdalisue/suda.vim'
  Plug 'lambdalisue/vim-manpager'
  Plug 'lilydjwg/fcitx.vim', {'on': []}
        \| au InsertEnter * call plug#load('fcitx.vim')
  Plug 'KabbAmine/vCoolor.vim'
else
  Plug 'Yggdroot/LeaderF', {'do': '.\install.bat'}
endif
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
Plug 'wsdjeg/FlyGrep.vim'
Plug 'misterbuckley/vim-definitive' "搜索定义、类声明等
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fubitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'rhysd/committia.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'liuchengxu/vista.vim'
Plug 'sbdchd/neoformat'
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vim-terminal-help'
Plug 'mg979/vim-visual-multi'
Plug 'konfekt/fastfold' "性能更好的语法折叠
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
Plug 'tpope/vim-surround' "匹配符号快捷操作
Plug 'terryma/vim-expand-region' "扩大缩小选择区域
Plug 'matze/vim-move' "代码块移动
Plug 'thaerkh/vim-workspace' "保留代码工作空间
Plug 'AndrewRadev/inline_edit.vim'
Plug 'airblade/vim-rooter'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mbbill/fencview', {'on': ['FencAutoDetect', 'FencView']}
Plug 'tweekmonster/startuptime.vim', {'on': 'StartupTime'}
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sleuth'
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json', {'for': 'json'}
      \| au BufNewFile,BufRead *.json call Func_vim_json()
Plug 'masukomi/vim-markdown-folding'
Plug 'yianwillis/vimcdoc'
set helplang=cn
Plug 'voldikss/vim-translator'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & npm install'}
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim' "增强/文字搜索
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'somini/vim-textobj-fold'
Plug 'mattn/vim-textobj-url'
Plug 'kana/vim-textobj-entire'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'pechorin/any-jump.vim'
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' } "模糊匹配搜索器/跳跃器
let g:aerojump_keymaps = {
  \ "<C-t>": "AerojumpDown",
  \ "<C-s>": "AerojumpUp",
  \ "<Esc>": "AerojumpExit",
  \ "<CR>": "AerojumpSelect",
  \ }
Plug 'chaoren/vim-wordmotion'
Plug 'uguu-org/vim-matrix-screensaver' "黑客帝国的屏保
Plug 'metakirby5/codi.vim', {'on': 'Codi'} "代码执行预览
" Plug 'tadaa/vimade' " 聚焦当前操作窗口,但在%s做替换时有bug,
" 并且在gvim下也有问题
Plug 'voldikss/vim-floaterm'
Plug 'chrisbra/NrrwRgn' "专注于选定区域，而使其余区域无法访问,选择区域后:NR
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
Plug 'brooth/far.vim' " 查找和替换
Plug 't9md/vim-choosewin' "快捷窗口选择-
nmap - <Plug>(choosewin)
"{{{
call plug#end()
"}}}
"}}}
" User Interface
"{{{lightline.vim
"{{{lightline.vim-usage
" :h 'statusline'
" :h g:lightline.component
"}}}
set laststatus=2  " Basic
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ ['homemode'], ['method'],
      \             ['gitbranch', 'gitgutter'],['cocerror'],['cocwarn']],
      \   'right':[ ['lineinfo'],
      \             ['percent'], ['fileformat','fileencoding'] , ['asyncrun_status']],
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
"}}}
"{{{tmuxline.vim
if g:vim_is_in_tmux == 1 && !has('win32')
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : '%R',
        \'c'    : [ '#{sysstat_mem} #[fg=blue]#{sysstat_ntemp} #[fg=green]\ufa51#{upload_speed}' ],
        \'win'  : [ '#I', '#W' ],
        \'cwin' : [ '#I', '#W', '#F' ],
        \'x'    : [ "#[fg=green]#{download_speed} \uf6d9 #[fg=blue]#{sysstat_itemp} #{sysstat_cpu}" ],
        \'y'    : [ '%a' ],
        \'z'    : '#H #{prefix_highlight}'
        \}
  let g:tmuxline_separators = {
        \ 'left' : "\ue0bc",
        \ 'left_alt': "\ue0bd",
        \ 'right' : "\ue0ba",
        \ 'right_alt' : "\ue0bd",
        \ 'space' : ' '}
endif
"}}}
"{{{colorscheme
" {{{
let  g:vim_color_scheme="challenger_deep"
colorscheme challenger_deep
"}}}
"{{{vim-startify
nnoremap <Leader>H :Startify<Cr>
if g:vim_enable_startify == 1
  let g:startify_session_dir = '~/.vim/sessions'
  let g:startify_files_number = 5
  let g:startify_update_oldfiles = 1
  let g:startify_session_delete_buffers = 1 " delete all buffers when loading or closing a session, ignore unsaved buffers
  let g:startify_change_to_dir = 1 " when opening a file or bookmark, change to its directory
  let g:startify_fortune_use_unicode = 1 " beautiful symbols
  let g:startify_padding_left = 3 " the number of spaces used for left padding
  let g:startify_session_remove_lines = ['setlocal', 'winheight'] " lines matching any of the patterns in this list, will be removed from the session file
  let g:startify_session_sort = 1 " sort sessions by alphabet or modification time
  let g:startify_custom_indices = ['1', '2', '3', '4', '5', '1', '2', '3', '4', '5'] " MRU indices
  " line 579 for more details
  if has('nvim')
    let g:startify_commands = [
          \ {'1': 'CocList'},
          \ {'2': 'terminal'},
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
  augroup startifyCustom
    autocmd!
    autocmd VimEnter *
          \   if !argc()
          \ |   call ExplorerStartify()
          \ | endif
    autocmd FileType startify call s:startify_mappings()
    " on Enter
    " autocmd User Startified nmap <silent><buffer> <CR> <plug>(startify-open-buffers):call ToggleCocExplorer()<CR>
  augroup END
endif
"}}}
"{{{vim-which-key
let g:which_key_sort_horizontal = 1
let g:which_key_sep = ''
let g:which_key_display_names = {' ': '', '<CR>': '↵', '<C-H>': '', '<C-I>': 'ﲑ', '<TAB>': '⇆'}
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
call which_key#register('<Space>', 'g:which_key_map')
let g:which_key_map = {
      \   'name': 'Alpha',
      \   '<Tab>': 'format',
      \   'p': 'paste',
      \   'q': 'close quickfix',
      \   'y': 'yank',
      \   'c': { 'name': 'comment' }
      \   }
let g:which_key_map["\<space>"] = {
      \   'name': 'Beta',
      \   'h': 'highlight'
      \   }
"}}}
"{{{nvim-colorizer.lua
lua require'colorizer'.setup()
"}}}
"{{{indentLine
"{{{indentLine-usage
" :LeadingSpaceToggle  切换显示Leading Space
" :IndentLinesToggle  切换显示indentLine
"}}}
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char = ''  " ¦┆│⎸▏
let g:indent_blankline_char = g:indentLine_char
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = [ 'startify', 'coc-explorer', 'codi', 'help', 'man', 'vtm', 'markdown' ]
let g:indentLine_setColors = 0  " disable overwrite with grey by default, use colorscheme instead
"}}}
"{{{limelight.vim
let g:limelight_default_coefficient = 0.7
"}}}
"{{{goyo.vim
"{{{goyo.vim-usage
" <leader>mr  toggle reading mode
"}}}
let g:goyo_width = 95
let g:goyo_height = 85
let g:goyo_linenr = 0
"进入goyo模式后自动触发limelight,退出后则关闭
augroup goyoCustom
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END
nnoremap <silent> <leader><space>F :<C-u>Limelight!!<CR>
nnoremap <silent> <leader><space>R :<C-u>Goyo<CR>
let g:which_key_map["\<space>"]['F'] = 'focus mode'
let g:which_key_map["\<space>"]['R'] = 'reading mode'
"}}}
"{{{golden-ratio
" 默认关闭
let g:golden_ratio_autocommand = 0
nnoremap <silent> <leader><space>g :<c-u>GoldenRatioResize<cr>
let g:which_key_map["\<space>"]['g'] = 'resize window'
"}}}
" Productivity
"{{{coc.nvim
"{{{coc-init
if !has('win32')
  let g:coc_data_home = expand('~/.local/share/nvim/coc')
endif
let g:coc_global_extensions = [
      \ 'coc-lists',
      \ 'coc-marketplace',
      \ 'coc-git',
      \ 'coc-explorer',
      \ 'coc-project',
      \ 'coc-gitignore',
      \ 'coc-bookmark',
      \ 'coc-highlight',
      \ 'coc-yank',
      \ 'coc-snippets',
      \ 'coc-syntax',
      \ 'coc-tag',
      \ 'coc-emoji',
      \ 'coc-dictionary',
      \ 'coc-nextword',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-tsserver',
      \ 'coc-tslint-plugin',
      \ 'coc-rust-analyzer',
      \ 'coc-sh',
      \ 'coc-markdownlint',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-vimlsp'
      \ ]
"}}}
"{{{coc-settings
augroup CocCustom
  autocmd!
  autocmd CursorHold * silent if g:coc_hover_enable == 1 && !coc#util#has_float() | call CocActionAsync('doHover') | endif
  autocmd CursorHold * silent if &filetype !=# 'markdown' | call CocActionAsync('highlight') | endif
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd User CocGitStatusChange call lightline#update()
  autocmd CursorHold * CocCommand git.refresh
augroup END
hi link BookMarkHI GitGutterAdd
let g:coc_hover_enable = 0
let g:tmuxcomplete#trigger = ''
set hidden
set completeopt=noinsert,noselect,menuone
set dictionary+=/usr/share/dict/words
set dictionary+=/usr/share/dict/american-english
"}}}
"{{{coc-mappings
inoremap <silent><expr> <C-j>
      \ coc#jumpable() ? "\<C-R>=coc#rpc#request('snippetNext', [])\<cr>" :
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<Down>"
inoremap <silent><expr> <C-k>
      \ coc#jumpable() ? "\<C-R>=coc#rpc#request('snippetPrev', [])\<cr>" :
      \ "\<Up>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? "\<Space>\<Backspace>\<CR>" : "\<CR>"
inoremap <silent><expr> <up> pumvisible() ? "\<Space>\<Backspace>\<up>" : "\<up>"
inoremap <silent><expr> <down> pumvisible() ? "\<Space>\<Backspace>\<down>" : "\<down>"
inoremap <silent><expr> <left> pumvisible() ? "\<Space>\<Backspace>\<left>" : "\<left>"
inoremap <silent><expr> <right> pumvisible() ? "\<Space>\<Backspace>\<right>" : "\<right>"
nnoremap <silent><expr> <C-pagedown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-pagedown>"
nnoremap <silent><expr> <C-pageup> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-pageup>"
inoremap <silent><expr> <C-pagedown> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<C-pagedown>"
inoremap <silent><expr> <C-pageup> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<C-pageup>"
nmap <silent> <leader>f<Space> :<C-u>CocList<CR>
nmap <silent> <leader>fy :<C-u>CocList yank<CR>
nmap <silent> <leader>fs :<C-u>CocList symbols<CR>
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jD <Plug>(coc-declaration)
nmap <silent> <leader>jt <Plug>(coc-type-definition)
nmap <silent> <leader>jr <Plug>(coc-references)
nmap <silent> <leader>jm <Plug>(coc-implementation)
nmap <silent> <leader><Space>r :<C-u>call CocActionAsync('rename')<CR>
nmap <silent> <leader><Space>a <Plug>(coc-codeaction-line)
vmap <silent> <leader><Space>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>v <Plug>(coc-range-select)
vmap <silent> <leader>v <Plug>(coc-range-select)
nmap <silent> <leader>gj <Plug>(coc-git-nextchunk)
nmap <silent> <leader>gk <Plug>(coc-git-prevchunk)
nmap <silent> <leader>gi <Plug>(coc-git-chunkinfo)
nmap <silent> <leader>gD :CocCommand git.diffCached<CR>
nmap <silent> <leader>gu :<C-u>CocCommand git.chunkUndo<CR>
nmap <silent> <leader>ga :<C-u>CocCommand git.chunkStage<CR>
nmap <silent> <leader>gF :<C-u>CocCommand git.foldUnchanged<CR>
nmap <silent> <leader>go :<C-u>CocCommand git.browserOpen<CR>
nmap <silent> <leader>gs :<C-u>CocList gstatus<cr>
nmap <silent> <leader>gla :<C-u>CocList commits<cr>
nmap <silent> <leader>glc :<C-u>CocList bcommits<cr>
nmap <silent> <leader>gll <Plug>(coc-git-commit)
nmap <silent> <leader><space>so :<C-u>CocCommand snippets.openSnippetFiles<cr>
nmap <silent> <leader><space>se :<C-u>CocCommand snippets.editSnippets<cr>
let g:which_key_map["\<space>"]['s'] = {
      \   'name': 'snippets',
      \   'e': 'edit snippets for current file type',
      \   'o': 'open snippet file'
      \   }
let g:which_key_map['j'] = {
      \   'name': 'jump',
      \   'd': 'definition',
      \   'D': 'declaration',
      \   't': 'type definition',
      \   'r': 'reference',
      \   'm': 'implementation',
      \   }
let g:which_key_map["\<space>"]['r'] = 'rename'
let g:which_key_map["\<space>"]['a'] = 'code action'
let g:which_key_map['v'] = 'range select'
let g:which_key_map['g'] = {
      \   'name': 'git',
      \   'j': 'chunk next',
      \   'k': 'chunk prev',
      \   'D': 'diff staged',
      \   'i': 'chunk info',
      \   'u': 'chunk undo',
      \   'a': 'chunk stage',
      \   's': 'status',
      \   'l': {'name': 'logs', 'a': 'log (all)', 'c': 'log (cur buf)', 'l': 'log (cur line)'},
      \   'F': 'toggle fold unchanged',
      \   'o': 'open remote url in the browser',
      \   }
let g:which_key_map['f'] = {
      \   'name': 'fuzzy finder',
      \   "\<Space>": 'list',
      \   's': 'symbols',
      \   'y': 'yank',
      \   }
nnoremap <silent> ? :let g:coc_hover_enable = (g:coc_hover_enable == 1 ? 0 : 1)<CR>
"}}}
"{{{coc-explorer
function ToggleCocExplorer()
  execute 'CocCommand explorer --toggle --width=35 --sources=buffer+,file+ ' . getcwd()
endfunction
nnoremap <silent> <C-b> :call ToggleCocExplorer()<CR>
augroup explorer_custom
  autocmd!
  autocmd FileType coc-explorer setlocal signcolumn=no
  autocmd FileType coc-explorer nnoremap <buffer><silent> <Tab> :<C-u>q<CR>:sleep 100m<CR>:Vista!!<CR>
  autocmd BufEnter * if (winnr("$") == 1 && &filetype ==# 'coc-explorer') | set guicursor=a:ver25-Cursor/lCursor | q | endif
augroup END
"}}}
"{{{coc-project
nnoremap <silent> <leader>fM :<c-u>CocList project<cr>
let g:which_key_map['f']['M'] = 'mru projects'
"}}}
"{{{coc-gitignore
nnoremap <silent> <leader><space>I :<c-u>CocList gitignore<cr>
let g:which_key_map["\<space>"]['I'] = 'gitignore'
"}}}
"{{{coc-bookmark
nmap <leader>mm <Plug>(coc-bookmark-toggle)
nmap <leader>ma <Plug>(coc-bookmark-annotate)
nmap <leader>mn <Plug>(coc-bookmark-next)
nmap <leader>mp <Plug>(coc-bookmark-prev)
nnoremap <silent> <leader>m<Space> :CocList bookmark<CR>
let g:which_key_map['m'] = {
      \   'name': 'bookmark',
      \   'm': 'toggle',
      \   'a': 'annotate',
      \   'n': 'next',
      \   'p': 'prev',
      \   "\<Space>": 'list',
      \   }
"}}}
"}}}
"{{{ale
"{{{ale-usage
let g:ALE_MODE = 1  " 0则只在保存文件时检查，1则只在normal模式下检查，2则异步检查
" 普通模式下<leader>lk和<leader>lj分别跳转到上一个、下一个错误
" :ALEDetail  查看详细错误信息
"}}}
" ls ~/.local/share/nvim/plugins/ale/ale_linters/
let g:ale_linters = {
      \       'asm': ['gcc'],
      \       'c': ['cppcheck', 'flawfinder'],
      \       'cpp': ['cppcheck', 'flawfinder'],
      \       'css': ['stylelint'],
      \       'html': ['tidy'],
      \       'json': [],
      \       'markdown': [],
      \       'python': ['pylint', 'flake8', 'mypy', 'pydocstyle'],
      \       'rust': [],
      \       'sh': ['shellcheck'],
      \       'text': [],
      \       'vim': ['vint'],
      \}
nnoremap <silent> <leader>dk :ALEPrevious<CR>
nnoremap <silent> <leader>dj :ALENext<CR>
nnoremap <silent> <leader>di :ALEDetail<CR>
let g:which_key_map['d'] = {
      \ 'name': 'diagnostics',
      \ 'j': 'next',
      \ 'k': 'prev',
      \ 'i': 'info'
      \ }
let g:ale_sign_error = "\uf65b"
let g:ale_sign_warning = "\uf421"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_delay = 0
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 10
let g:ale_virtualtext_prefix = '▸'
"防止java在中文系统上警告和提示乱码
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
"显示Linter名称,出错或警告等相关信息
" ale-mode
if g:ALE_MODE == 0
  let g:ale_lint_on_text_changed = 'never'
elseif g:ALE_MODE == 1
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
elseif g:ALE_MODE == 2
  let g:ale_lint_on_text_changed = 'always'
  let g:ale_lint_delay=100
endif
"}}}
"{{{Clap
nnoremap <Leader>c :Clap<Cr>
nnoremap <Leader>cb :Clap buffers<Cr>
nnoremap <Leader>cf :Clap files<Cr>
nnoremap <Leader>ce :Clap filer<Cr>
nnoremap <Leader>cg :Clap grep<Cr>
nnoremap <Leader>gg :Clap grep2<Cr>
let g:clap_insert_mode_only = v:true
let g:clap_current_selection_sign = { 'text': '->', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
let g:clap_selected_sign = { 'text': ' ·', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
let g:clap_fuzzy_match_hl_groups = [
      \ [118 , '#9922ff'] ,
      \ [82  , '#a236ff'] ,
      \ [46  , '#ab49ff'] ,
      \ [47  , '#b45dff'] ,
      \ [48  , '#bd70ff'] ,
      \ [49  , '#c684ff'] ,
      \ [50  , '#f287ca'] ,
      \ [51  , '#f075c3'] ,
      \ [87  , '#ef63bb'] ,
      \ [123 , '#ed51b3'] ,
      \ [159 , '#eb40ab'] ,
      \ [195 , '#e92ea4'] ,
      \ ]
"}}}
"{{{LeaderF
let g:Lf_ShortcutF = '<A-z>`````ff'
let g:Lf_ShortcutB = '<A-z>`````ff'
let g:Lf_WindowHeight = 0.4
let g:Lf_ShowRelativePath = 0
let g:Lf_CursorBlink = 1
let g:Lf_CacheDirectory = expand('~/.cache/vim/leaderf')
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.vscode']
let g:Lf_ShowHidden = 1
let g:Lf_ReverseOrder = 1
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewHorizontalPosition = 'center'
let g:Lf_PreviewResult = {
      \ 'File': 0,
      \ 'Buffer': 0,
      \ 'Mru': 0,
      \ 'Tag': 0,
      \ 'BufTag': 0,
      \ 'Function': 0,
      \ 'Line': 0,
      \ 'Colorscheme': 0,
      \ 'Rg': 0,
      \ 'Gtags': 0
      \}
let g:Lf_WildIgnore = {
      \ 'dir': ['.svn','.git','.hg', '.vscode'],
      \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
      \}
let g:Lf_RgConfig = [
      \ '--glob=!\.git/*',
      \ '--glob=!\.vscode/*',
      \ '--glob=!\.svn/*',
      \ '--glob=!\.hg/*',
      \ '--case-sensitive',
      \ has('win32') ? '--crlf' : '--no-crlf',
      \ '--multiline',
      \ '--hidden'
      \ ]
nnoremap <silent> <leader>t :<C-u>LeaderfBufTagAll<CR>
nnoremap <silent> <leader>b :<C-u>LeaderfBufferAll<CR>
nnoremap <silent> <leader>f :<C-u>LeaderfFile<CR>
nnoremap <silent> <leader>fh :<C-u>LeaderfHelp<CR>
nnoremap <silent> <leader>fl :<C-u>LeaderfLine<CR>
nnoremap <silent> <leader>fm :<C-u>LeaderfMruCwd<CR>
nnoremap <silent> <leader>g :<C-u>Leaderf rg<CR>
let g:which_key_map['f']['t'] = 'tags'
let g:which_key_map['f']['b'] = 'buffers'
let g:which_key_map['f']['f'] = 'files'
let g:which_key_map['f']['h'] = 'helps'
let g:which_key_map['f']['l'] = 'lines'
let g:which_key_map['f']['m'] = 'mru files'
let g:which_key_map['f']['g'] = 'grep'
"}}}
"{{{vim-sneak
let g:sneak#s_next = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"}}}
"{{{undotree
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 35
let g:undotree_DiffpanelHeight = 10
nnoremap <silent> <leader><space>u :<c-u>UndotreeToggle<cr>
let g:which_key_map["\<space>"]['u'] = 'undotree'
"}}}
"{{{vim-fugitive
"{{{twiggy
command Gbranch Twiggy
nnoremap <silent> <leader>gB :<C-u>Twiggy<CR>
let g:which_key_map['g']['B'] = 'branch'
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_num_columns = 35
let g:twiggy_close_on_fugitive_command = 1
let g:twiggy_remote_branch_sort = 'date'
let g:twiggy_show_full_ui = 0
"}}}
"{{{committia.vim
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  " Additional settings
  setlocal spell

  " If no commit message, start with insert mode
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  endif

  " Scroll the diff window from insert mode
  imap <buffer><PageDown> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><PageUp> <Plug>(committia-scroll-diff-up-half)
  imap <buffer><S-PageDown> <Plug>(committia-scroll-diff-down-page)
  imap <buffer><S-PageUp> <Plug>(committia-scroll-diff-up-page)
endfunction
"}}}
"{{{mergetool
let g:mergetool_layout = 'br,m'  " `l`, `b`, `r`, `m`
let g:mergetool_prefer_revision = 'local'  " `local`, `base`, `remote`
nmap <leader>gm <plug>(MergetoolToggle)
let g:which_key_map['g']['m'] = 'merge'
"}}}
noremap <silent> <leader>gd :Gdiffsplit<cr>
noremap <silent> <leader>gw :Gwrite<cr>
let g:which_key_map['g']['d'] = 'diff unstaged'
let g:which_key_map['g']['w'] = 'write and stage'
"}}}
"{{{vista.vim
nnoremap <silent> <A-b> :<C-u>Vista!!<CR>
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_sidebar_width = 35
let g:vista_cursor_delay = 100
let g:vista_keep_fzf_colors = 1
let g:vista_fzf_opt = ['--layout=default', '--prompt=➤ ']
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
      \ 'markdown': 'toc',
      \ 'javascript': 'coc',
      \ 'javascriptreact': 'coc',
      \ 'typescript': 'coc',
      \ 'typescriptreact': 'coc',
      \ 'python': 'coc',
      \ 'rust': 'coc',
      \ }
augroup vista_custom
  autocmd!
  " autocmd FileType vista,vista_kind nnoremap <buffer><silent> <Tab> :<C-u>q<CR>:sleep 150m<CR>:call ToggleCocExplorer()<CR>
  autocmd FileType vista,vista_kind nmap <buffer><silent> o <CR>
augroup END
"}}}
"{{{neoformat
"{{{Neoformat_Default_Filetype_Formatter
function! Neoformat_Default_Filetype_Formatter()
  if &filetype ==# 'c'
    execute 'Neoformat astyle'
  elseif &filetype ==# 'cpp'
    execute 'Neoformat astyle'
  else
    execute 'Neoformat'
  endif
endfunction
"}}}
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
nnoremap <silent> <leader><Tab> :<C-u>call Neoformat_Default_Filetype_Formatter()<CR>
vnoremap <silent> <leader><Tab> :Neoformat! &ft<CR>
"}}}
let g:NERDToggleCheckAllLines = 1
"}}}
"{{{asynctasks
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'bottom' " tab
let g:asynctasks_term_rows = 10
let g:asynctasks_config_name = '.git/tasks.ini'
noremap <silent> <leader>trf :AsyncTask file-run<cr>
noremap <silent> <leader>trp :AsyncTask project-run<cr>
noremap <silent> <leader>tbf :AsyncTask file-build<cr>
noremap <silent> <leader>tbp :AsyncTask project-build<cr>
noremap <silent> <leader>te :AsyncTaskEdit<cr>
noremap <silent> <leader>g^s :AsyncRun git config --global http.proxy "socks5://127.0.0.1:1080"<cr>
noremap <silent> <leader>g^h :AsyncRun git config --global http.proxy "http://127.0.0.1:1081"<cr>
noremap <silent> <leader>g$ :AsyncRun git config --global --unset http.proxy<cr>
noremap <silent> <leader>gp :AsyncRun git push origin HEAD<cr>
noremap <silent> <leader>gf :AsyncRun git fetch origin<cr>
noremap <silent> <leader>gc :Git commit<cr>
let g:which_key_map['t'] = {
      \ 'name': 'task',
      \ 'r': {'name': 'run task', 'f': 'file', 'p': 'project'},
      \ 'b': {'name': 'build task', 'f': 'file', 'p': 'project'},
      \ 'e': 'edit config'
      \ }
let g:which_key_map['g']['^'] = {'name': 'set proxy', 's': 'socks5', 'h': 'http'}
let g:which_key_map['g']['$'] = 'unset proxy'
let g:which_key_map['g']['c'] = 'commit'
let g:which_key_map['g']['p'] = 'push'
let g:which_key_map['g']['f'] = 'fetch'
"}}}
"{{{vim-terminal-help
let g:terminal_default_mapping = 0
let g:terminal_key = '<A-=>'
let g:terminal_cwd = 2
let g:terminal_height = 13
let g:terminal_kill = 'term'
let g:terminal_list = 0
"{{{
let s:cmd = 'nnoremap <silent>'.(g:terminal_key). ' '
exec s:cmd . ':call TerminalToggle()<cr>'

if has('nvim') == 0
  let s:cmd = 'tnoremap <silent>'.(g:terminal_key). ' '
  exec s:cmd . '<c-_>:call TerminalToggle()<cr>'
else
  let s:cmd = 'tnoremap <silent>'.(g:terminal_key). ' '
  exec s:cmd . '<c-\><c-n>:call TerminalToggle()<cr>'
endif
"}}}
"}}}
"{{{vim-visual-multi
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Switch Mode']                 = 'v'
let g:VM_maps['Add Cursor At Pos']           = '`'
let g:VM_maps['Visual Cursors']              = '`'
"}}}
"{{{suda.vim
"{{{suda.vim-usage
" :E filename  sudo edit
" :W       sudo edit
"}}}
command! -nargs=1 E  edit  suda://<args>
command W w suda://%
"}}}
"{{{inline_edit.vim
nnoremap <silent> <leader><space>e :<C-u>InlineEdit<CR>
vnoremap <silent> <leader><space>e :InlineEdit<CR>
let g:which_key_map["\<space>"]['e'] = 'inline edit'
"}}}
"{{{comfortable-motion.vim
"{{{comfortable-motion.vim-usage
" <pageup> <pagedown>平滑滚动
" nvim中，<A-J>和<A-K>平滑滚动
"}}}
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
nnoremap <silent> <pagedown> :<C-u>call comfortable_motion#flick(130)<CR>
nnoremap <silent> <pageup> :<C-u>call comfortable_motion#flick(-130)<CR>
nnoremap <silent> <C-d> :<C-u>call comfortable_motion#flick(120)<CR>
nnoremap <silent> <C-u> :<C-u>call comfortable_motion#flick(-120)<CR>
"}}}
"{{{auto-pairs
let g:AutoPairsShortcutToggle = '<A-z>p'
let g:AutoPairsShortcutFastWrap = '<A-z>`sadsfvf'
let g:AutoPairsShortcutJump = '<A-n>'
let g:AutoPairsWildClosedPair = ''
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0
let g:AutoPairsMapCh = 0
inoremap <A-z>' '
inoremap <A-z>" "
inoremap <A-z>` `
inoremap <A-z>( (
inoremap <A-z>[ [
inoremap <A-z>{ {
inoremap <A-z>) )
inoremap <A-z>] ]
inoremap <A-z>} }
inoremap <A-Backspace> <Space><Esc><left>"_xa<Backspace>
" imap <A-Backspace> <A-z>p<Backspace><A-z>p
augroup autoPairsCustom
  autocmd!
  " au Filetype html let b:AutoPairs = {"<": ">"}
augroup END
"}}}
"{{{pomodoro.vim
let g:Pomodoro_Status = 0
function! Toggle_Pomodoro()
  if g:Pomodoro_Status == 0
    let g:Pomodoro_Status = 1
    execute 'PomodoroStart'
  elseif g:Pomodoro_Status == 1
    let g:Pomodoro_Status = 0
    execute 'PomodoroStop'
  endif
endfunction
let g:pomodoro_time_work = 25
let g:pomodoro_time_slack = 5
nnoremap <silent> <leader><space>P :<c-u>call Toggle_Pomodoro()<cr>
let g:which_key_map["\<space>"]['P'] = 'pomodoro toggle'
"}}}
"{{{vim-matchup
let g:matchup_matchparen_deferred = 1  " highlight surrounding
let g:matchup_matchparen_hi_surround_always = 1  " highlight surrounding
let g:matchup_delim_noskips = 2  " don't recognize anything in comments
"}}}
" {{{vim-manpager
if exists('g:vim_man_pager') && !has('win32')
  function! s:vim_manpager_mappings() abort
    nmap <C-]> <Plug>(manpager-open)
    nmap <silent><buffer> <C-j> ]t
    nmap <silent><buffer> <C-k> [t
    nnoremap <silent><buffer> E :<C-u>set modifiable<CR>
  endfunction
  augroup manPagerCustom
    autocmd!
    autocmd FileType man call s:vim_manpager_mappings()
  augroup END
endif
" }}}
"{{{vim-closetag
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<A-z>>'
" whitelist
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.js,*.jsx,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.js'
let g:closetag_emptyTags_caseSensitive = 1
"}}}
"{{{vim-json
function! Func_vim_json()
  let g:vim_json_syntax_conceal = 0
  set foldmethod=syntax
endfunction
"}}}
"{{{vCoolor.vim
if !has('win32')
  let g:vcoolor_disable_mappings = 1
  let g:vcoolor_lowercase = 1
  let g:vcoolor_custom_picker = 'zenity --title "custom" --color-selection --color '
  nnoremap <silent> <leader><space>cc :<c-u>VCoolor<cr>
  nnoremap <silent> <leader><space>cr :<c-u>VCoolor r<cr>
  nnoremap <silent> <leader><space>cH :<c-u>VCoolor h<cr>
  nnoremap <silent> <leader><space>cR :<c-u>VCoolor ra<cr>
  let g:which_key_map["\<space>"]['c'] = {
        \   'name': 'color picker',
        \   'c': 'insert hex',
        \   'r': 'insert rgb',
        \   'H': 'insert hsl',
        \   'R': 'insert rgba'
        \   }
endif
"}}}
"{{{vim-devicons
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[''] = "\uf15b"
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
"}}}
"{{{vim-translator
let g:translator_target_lang = 'zh'
let g:translator_source_lang = 'auto'
let g:translator_default_engines = ['bing', 'youdao']
nmap <leader><Space>t <Plug>TranslateW
vmap <leader><Space>t <Plug>TranslateWV
let g:which_key_map["\<space>"]['t'] = 'translate'
"}}}
"{{{markdown-preview.nvim
if !has('win32')
  let g:mkdp_browser = 'firefox-developer-edition'
else
  let g:mkdp_browser = 'firefox'
endif
let g:mkdp_echo_preview_url = 1
nmap <silent> <leader><space>p <Plug>MarkdownPreviewToggle
let g:which_key_map["\<space>"]['p'] = 'preview markdown'
"}}}
"{{{vim-peekaboo
let g:peekaboo_delay = 500
"}}}
"{{{vim-easy-align
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
let g:which_key_map['a'] = 'align'
"}}}
"{{{incsearch.vim
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
augroup IncsearchCustom
  autocmd!
  autocmd User IncSearchEnter set hlsearch
augroup END
"}}}
"{{{vim-textobj-user
call textobj#user#plugin('line', {
      \   '-': {
      \     'select-a-function': 'CurrentLineA',
      \     'select-a': 'al',
      \     'select-i-function': 'CurrentLineI',
      \     'select-i': 'il',
      \   },
      \ })
function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  let tail_pos[2] = tail_pos[2] + 1
  return ['v', head_pos, tail_pos]
endfunction
function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
        \ non_blank_char_exists_p
        \ ? ['v', head_pos, tail_pos]
        \ : 0
endfunction
"}}}
"{{{any-jump.vim
let g:any_jump_disable_default_keybindings = 1
nnoremap gd :AnyJump<CR>
xnoremap gd :AnyJumpVisual<CR>
"}}}
"{{{vim-wordmotion
let g:wordmotion_disable_default_mappings = v:true
nmap W <Plug>WordMotion_w
omap W <Plug>WordMotion_w
xmap W <Plug>WordMotion_w
nmap B <Plug>WordMotion_b
omap B <Plug>WordMotion_b
xmap B <Plug>WordMotion_b
nmap E <Plug>WordMotion_e
omap E <Plug>WordMotion_e
xmap E <Plug>WordMotion_e
nmap gE <Plug>WordMotion_ge
omap gE <Plug>WordMotion_ge
xmap gE <Plug>WordMotion_ge
omap aW <Plug>WordMotion_aw
xmap aW <Plug>WordMotion_aw
omap iW <Plug>WordMotion_iw
xmap iW <Plug>WordMotion_iw
"}}}
