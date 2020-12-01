" 4. 插件安装

" 环境要求nodejs(neovim), python3
" 需要使用Scoop(或chcoc)安装ctags, fzf, maple, ripgrep
" 参考: https://github.com/phaazon/config/tree/master/nvim
" 参考：https://github.com/sainnhe/dotfiles
" 参考：https://github.com/sternelee/vime

call plug#begin('~/.vim/plugged')

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   Plug 'shougo/vimproc.vim' "windows需要同时dll文件到插件目录下
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
" Plug 'Shougo/neco-syntax'
" Plug 'quramy/tsuquyomi'
" let g:tsuquyomi_completion_detail = 1
" Plug 'mhartington/nvim-typescript' " windows 不支持
" Plug 'runoshun/tscompletejob'
" if has('win32') || has('win64')
"   Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
"   "tabnine 占用内存太大
"   Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'powershell.exe .\install.ps1',
"     \ }
" else
"   Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"   Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" endif

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" " Or map each action separately
" nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <F2> <Plug>(lcn-rename)
" Plug 'Shougo/denite.nvim'
" Plug 'sebastianmarkow/deoplete-rust'
" Plug 'wokalski/autocomplete-flow'
" " For func argument completion
" Plug 'Shougo/neosnippet'| Plug 'Shougo/neosnippet-snippets'
" let g:neosnippet#enable_completed_snippet = 1
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'w0rp/ale' " 语法检测
" Plug 'sbdchd/neoformat'
" Plug 'prettier/prettier'
" Plug 'scrooloose/syntastic'
" Plug 'rust-lang/rust.vim'
" let g:rustfmt_autosave = 1
Plug 'preservim/tagbar'
nmap <F8> :TagbarToggle<CR>

Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-dispatch', {'on': 'Dispatch'} "异步执行make和test
" Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
" Plug 'junegunn/fzf.vim' | Plug 'antoinemadec/coc-fzf',  {'branch': 'release'}
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
Plug 'wsdjeg/FlyGrep.vim'
Plug 'misterbuckley/vim-definitive' "搜索定义、类声明等
" Plug 'yggdroot/leaderf' " 使用grep的rg时python内存占用过大且卡
" 函数列表
Plug 'liuchengxu/vista.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vim-which-key' "显示leader快捷键
Plug 'junegunn/vim-easy-align' "代码对齐
" git插件
Plug 'tpope/vim-fugitive', {'on': ['Gwrite', 'Gcommit', 'Gread', 'Gdiff', 'Gblame']}
\ | Plug 'rbong/vim-flog'
\ | Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim' "状态栏显示
Plug 'mgee/lightline-bufferline' "状态栏buffer快捷导航
" Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim', { 'on': 'PomodoroStart' } "番茄时钟
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'
" 显示颜色 例如: #654456
if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
endif
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
Plug 'justinmk/vim-sneak' "双字母选择的光标移动
" 显示文件图标
if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
else
    Plug 'ryanoasis/vim-devicons'
endif
Plug 'leafoftree/vim-vue-plugin'
Plug 'moll/vim-node', {'for': ['javascript', 'typescript']}
" if has('nvim')
"     Plug 'nvim-treesitter/nvim-treesitter' " 性能更好的语法高亮
"     Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"     Plug 'nvim-treesitter/nvim-treesitter-refactor'
"     Plug 'nvim-treesitter/playground'
"     Plug 'romgrk/nvim-treesitter-context'
"     set foldmethod=expr
"     set foldexpr=nvim_treesitter#foldexpr()
" else
"     Plug 'sheerun/vim-polyglot' " 多语言的代码高亮集成包
"     Plug 'octol/vim-cpp-enhanced-highlight'
" endif
" Plug 'mattn/emmet-vim', { 'for': 'html' } "html快捷生成代码块,已经用了coc
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}
Plug 'herringtondarkholme/yats.vim', { 'for': ['javascript','typescript', 'typescript-tsx'] } "typescript语法高亮
Plug 'Quramy/vim-js-pretty-template', { 'for': ['javascript-jsx', 'typescript-tsx'] } "高亮jsx结构
Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript-jsx', 'typescript-tsx'] } "jsx语法缩进
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'janko-m/vim-test' "测试工具
" 多光标
Plug 'mg979/vim-visual-multi'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'liuchengxu/space-vim-dark'
" Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'jiangmiao/auto-pairs' "符号补全
Plug 'matze/vim-move', {'on': [
  \ '<Plug>MoveBlockDown',
  \ '<Plug>MoveBlockUp',
  \ '<Plug>MoveBlockRight',
  \ '<Plug>MoveBlockLeft']}   " 代码块移动
" Plug 'thaerkh/vim-workspace' "保留代码工作空间
Plug 'alvan/vim-closetag' "自动闭合标签
Plug 'luochen1990/rainbow' "彩虹符号匹配
" Plug 'ianva/vim-youdao-translater' "有道翻译
" 翻译插件
Plug 'iamcco/dict.vim', {'on':
    \ [
    \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
    \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
    \ ]}
"Plug 'vim-scripts/YankRing.vim' "yank工具
Plug 'junegunn/vim-peekaboo' "查看历史的复制和删除的寄存器, @或\" 触发
Plug 'tpope/vim-eunuch', {'on': ['Mkdir', 'Rename', 'Unlink', 'Delete', 'Move', 'Chmod', 'Cfind', 'Clocate', 'Lfine', 'Llocate', 'SudoEdit', 'SudoWrite', 'Wall', 'W']} " 加强的目录和文件编辑
" 最大化窗口，ctrl w o
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
Plug 'tpope/vim-repeat' "重复命令操作
Plug 'ntpeters/vim-better-whitespace' "显示多余空格
Plug 'mhinz/vim-startify' "启动界面预览
Plug 'yggdroot/indentline' "配置显示缩进对齐线
Plug 'kristijanhusak/vim-carbon-now-sh' "代码块生成图片
Plug 'editorconfig/editorconfig-vim'
" Plug 'tpope/vim-sleuth' "自适应配置缓冲选项
" Plug 'nicwest/vim-http', {'on': 'Http'} "配置http请求
"Plug 'scrooloose/nerdcommenter' "快捷代码注释
Plug 'tpope/vim-commentary' "快捷代码注释
" 生成注释文档
Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}
Plug 'asins/vimcdoc' "中文文档计划
" Plug 'jbgutierrez/vim-better-comments' "显示注释
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' } "快捷窗口选择-
Plug 'pechorin/any-jump.vim' "跳转到函数定义
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' } "模糊匹配搜索器/跳跃器
let g:aerojump_keymaps = {
  \ "<C-t>": "AerojumpDown",
  \ "<C-s>": "AerojumpUp",
  \ "<Esc>": "AerojumpExit",
  \ "<CR>": "AerojumpSelect",
  \ }
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug', 'vimwiki'], 'on': 'MarkdownPreview'}
Plug 'mzlogin/vim-markdown-toc'
" 专注阅读
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
\ | Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'markonm/traces.vim'
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
" Plug 'gpanders/vim-medieval', {'for': 'markdown'}  "评估markdown代码块
" 语法检查
Plug 'rhysd/vim-grammarous', {'for': ['markdown', 'vimwiki', 'md', 'tex']}
Plug 'jceb/vim-orgmode'
let g:org_agenda_files = ['~/org/index.org']
let g:org_aggressive_conceal = 1
let g:org_heading_shade_leading_stars = 1
let g:org_todo_keywords = ['TODO', 'WIP', 'REVIEW', '|', 'DONE', 'CANCELLED']
let g:org_indent = 1
Plug 'uguu-org/vim-matrix-screensaver', {'on': 'Matrix'} "黑客帝国的屏保
Plug 'metakirby5/codi.vim', {'on': 'Codi'} "代码执行预览
Plug 'puremourning/vimspector' "可视化debug
Plug 'skywind3000/asynctasks.vim' "任务
Plug 'skywind3000/asyncrun.vim'
Plug 'christoomey/vim-conflicted'
Plug 'chrisbra/vim-diff-enhanced'
" Plug 'tommcdo/vim-exchange'
Plug 'brooth/far.vim' " 全局替换插件
" 关闭buffer而不关闭窗口
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" 平滑滚动
Plug 'psliwka/vim-smoothie'
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
Plug 'tadaa/vimade' " 聚焦当前操作窗口,但在%s做替换时有bug
" Plug 'vimwiki/vimwiki'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'kana/vim-textobj-user'
Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']} " 悬浮终端
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
if  executable("tmux") && strlen($TMUX)
    " tmux与vim窗口间导航
    Plug 'christoomey/vim-tmux-navigator'
    " tmux.conf set -g focus-events on
    Plug 'tmux-plugins/vim-tmux-focus-events'
    " 在tmux和vim之间进行复制与粘贴
    Plug 'roxma/vim-tmux-clipboard'
    " tmux补全插件
    Plug 'wellle/tmux-complete.vim'
endif

" Initialize plugin system
call plug#end()

filetype plugin indent on  " 根据侦测到的不同类型加载对应的插件
set completeopt=longest,preview,menu " 代码补全
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>
