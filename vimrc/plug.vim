" 4. 插件安装

" 环境要求nodejs(neovim), python3
" 需要使用Scoop(或chcoc)安装ctags, fzf, maple, ripgrep
" 参考: https://github.com/phaazon/config/tree/master/nvim
" 参考：https://github.com/sainnhe/dotfiles

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
Plug 'sbdchd/neoformat'
" Plug 'prettier/prettier'
" Plug 'scrooloose/syntastic'
" Plug 'rust-lang/rust.vim'
" let g:rustfmt_autosave = 1
Plug 'preservim/tagbar'
nmap <F8> :TagbarToggle<CR>

Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-dispatch', {'on': 'Dispatch'} "异步执行make和test
" Plug 'junegunn/fzf.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "模糊搜索
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
Plug 'wsdjeg/FlyGrep.vim'
Plug 'misterbuckley/vim-definitive' "搜索定义、类声明等
" Plug 'yggdroot/leaderf' " 使用grep的rg时python内存占用过大且卡
Plug 'liuchengxu/vista.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } "显示leader快捷键
Plug 'junegunn/vim-easy-align' "代码对齐
Plug 'tpope/vim-fugitive' "git工具
Plug 'itchyny/lightline.vim' "状态栏显示
Plug 'mgee/lightline-bufferline' "状态栏buffer快捷导航
" Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim', { 'on': 'PomodoroStart' } "番茄时钟
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'
Plug 'norcalli/nvim-colorizer.lua' " 颜色值显示
Plug 'haya14busa/incsearch.vim' "增强/文字搜索
Plug 'konfekt/fastfold' "性能更好的语法折叠
Plug 'tpope/vim-surround' "匹配符号快捷操作
Plug 'terryma/vim-expand-region' "扩大缩小选择区域
Plug 'easymotion/vim-easymotion' "基于字母的光标快速移动
Plug 'justinmk/vim-sneak' "双字母选择的光标移动
Plug 'ryanoasis/vim-devicons' "显示文件图标
Plug 'sheerun/vim-polyglot' "多语言的代码高亮集成包
Plug 'leafoftree/vim-vue-plugin'
Plug 'moll/vim-node', {'for': ['javascript', 'typescript']}
" Plug 'nvim-treesitter/nvim-treesitter' "性能更好的语法高亮
" Plug 'nvim-treesitter/nvim-treesitter-refactor'
" Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
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
" Plug 'terryma/vim-multiple-cursors'
" Plug 'liuchengxu/space-vim-dark'
" Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'jiangmiao/auto-pairs' "符号补全
Plug 'matze/vim-move' "代码块移动
" Plug 'thaerkh/vim-workspace' "保留代码工作空间
Plug 'alvan/vim-closetag' "自动闭合标签
Plug 'luochen1990/rainbow' "彩虹符号匹配
Plug 'ianva/vim-youdao-translater' "有道翻译
"Plug 'vim-scripts/YankRing.vim' "yank工具
Plug 'junegunn/vim-peekaboo' "查看历史的复制和删除的寄存器, @或\" 触发
Plug 'tpope/vim-eunuch' "加强的文件编辑
Plug 'tpope/vim-repeat' "重复命令操作
Plug 'ntpeters/vim-better-whitespace' "显示多余空格
Plug 'mhinz/vim-startify' "启动界面预览
Plug 'yggdroot/indentline' "配置显示缩进对齐线
Plug 'kristijanhusak/vim-carbon-now-sh' "代码块生成图片
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
" Plug 'tpope/vim-sleuth' "自适应配置缓冲选项
" Plug 'nicwest/vim-http', {'on': 'Http'} "配置http请求
"Plug 'scrooloose/nerdcommenter' "快捷代码注释
Plug 'tpope/vim-commentary' "快捷代码注释
Plug 'asins/vimcdoc' "中文文档计划
" Plug 'jbgutierrez/vim-better-comments' "显示注释
Plug 't9md/vim-choosewin' "快捷窗口选择-
Plug 'pechorin/any-jump.vim' "跳转到函数定义
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' } "模糊匹配搜索器/跳跃器
let g:aerojump_keymaps = {
  \ "<C-t>": "AerojumpDown",
  \ "<C-s>": "AerojumpUp",
  \ "<Esc>": "AerojumpExit",
  \ "<CR>": "AerojumpSelect",
  \ }
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
Plug 'junegunn/goyo.vim', {'for': 'markdown'} "专注模式
Plug 'junegunn/limelight.vim', {'for': 'markdown'} "专注模式代码行块
" Plug 'gpanders/vim-medieval', {'for': 'markdown'}  "评估markdown代码块
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
Plug 'tommcdo/vim-exchange'
Plug 'brooth/far.vim' " 查找和替换
" Plug 'andrewradev/linediff.vim' "行代码的对比
" Plug 'valloric/matchtagalways'
" Plug 'andymass/vim-matchup' " 高亮匹配语句
Plug 'tpope/vim-characterize' "ga显示光标下 Unicode 字符的名称、代码点值和十六进制值
" Plug 'stefandtw/quickfix-reflector.vim'
" Plug 'machakann/vim-swap' "交换参数, g>或g<
Plug 'tadaa/vimade' " 聚焦当前操作窗口,但在%s做替换时有bug
Plug 'vimwiki/vimwiki'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'kana/vim-textobj-user'
Plug 'voldikss/vim-floaterm'
" Plug 'danilamihailov/beacon.nvim' "看到你的跳转
" Plug 'lifepillar/vim-mucomplete' "链式的极简自动完成
Plug 'chrisbra/NrrwRgn' "专注于选定区域，而使其余区域无法访问,选择区域后:NR
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
" Plug 'inkarkat/vim-SyntaxRange'
" Plug 'tpope/vim-dadbod' "数据库连接管理
" Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-sensible' "合适的默认配置
" Plug 'tpope/vim-apathy' "搜索优化
Plug 'tpope/vim-unimpaired' "符号映射
Plug 'tpope/vim-scriptease'

" Initialize plugin system
call plug#end()

filetype plugin indent on  " 根据侦测到的不同类型加载对应的插件
set completeopt=longest,preview,menu " 代码补全
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>
