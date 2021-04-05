" 插件安装

" 环境要求nodejs(neovim), python3
" 需要使用Scoop(或chcoc)全局安装 ctags, fzf, maple, ripgrep, bat, fd
" 参考: https://zhuanlan.zhihu.com/p/348257414
" 参考: https://github.com/phaazon/config/tree/master/nvim
" 参考：https://github.com/sainnhe/dotfiles
" 参考：https://github.com/sternelee/vime
" 插件推荐: https://blog.csdn.net/weixin_31468621/article/details/112422509

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'w0rp/ale' " 语法检测
" Plug 'sbdchd/neoformat'
" Plug 'prettier/prettier'
" Plug 'scrooloose/syntastic'
" Plug 'rust-lang/rust.vim'
" let g:rustfmt_autosave = 1
" Plug 'jayli/vim-easycomplete'
" Plug 'skywind3000/vim-dict'
" Plug 'skywind3000/vim-auto-popmenu'
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
" let g:apc_enable_ft = {'*':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
" set cpt=.,k,w,b
" 不要自动选中第一个选项。
" set completeopt=menu,menuone,noselect,longest,preview,
" 禁止在下方显示一些啰嗦的提示
" set shortmess+=c

" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'tpope/vim-dispatch', {'on': 'Dispatch'} "异步执行make和test
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim' " needed for previews
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" Plug 'wsdjeg/FlyGrep.vim'
" Plug 'misterbuckley/vim-definitive' "搜索定义、类声明等
" 函数列表
" Plug 'preservim/tagbar'
" nmap <F8> :TagbarToggle<CR>
Plug 'liuchengxu/vista.vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
Plug 'liuchengxu/vim-which-key' "显示leader快捷键
Plug 'junegunn/vim-easy-align' "代码对齐
" git插件
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rbong/vim-flog'
Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
" Plug 'rhysd/git-messenger.vim'
Plug 'sjl/gundo.vim'
" gist 相关
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'junegunn/gv.vim'
" Plug 'apzelos/blamer.nvim'
" let g:blamer_enabled = 1
Plug 'lambdalisue/gina.vim'
Plug 'itchyny/lightline.vim' "状态栏显示
Plug 'mgee/lightline-bufferline' "状态栏buffer快捷导航
Plug 'itchyny/vim-gitbranch'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim', { 'on': 'PomodoroStart' } "番茄时钟
Plug 'haya14busa/incsearch.vim' "增强/文字搜索
Plug 'konfekt/fastfold' "性能更好的语法折叠
Plug 'sickill/vim-pasta'
" 功能很强的折叠插件, zc zo
" Plug 'pseewald/vim-anyfold'
Plug 'tpope/vim-surround' "匹配符号快捷操作
Plug 'terryma/vim-expand-region' "扩大缩小选择区域
Plug 'easymotion/vim-easymotion' " 基于字母的光标快速移动
Plug 'phaazon/hop.nvim'
" Plug 'hrsh7th/vim-eft'
Plug 'justinmk/vim-sneak' "双字母选择的光标移动
let g:sneak#label = 1
Plug 'airblade/vim-rooter'
" 显示文件图标
Plug 'ryanoasis/vim-devicons'
Plug 'leafoftree/vim-vue-plugin'
Plug 'moll/vim-node', {'for': ['javascript', 'typescript']}
if has('nvim')
    " https://github.com/glepnir/nvim-lua-guide-zh
    Plug 'kyazdani42/nvim-web-devicons'
    " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    " Plug 'glepnir/zephyr-nvim'
    " Plug 'romgrk/barbar.nvim'
    " nnoremap <silent> gb :BufferLinePick<CR>
    " Plug 'akinsho/nvim-bufferline.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "性能更好的语法高亮,需要night版本,建议更新完后把lua文件同步到nvim的lua目录下
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'nvim-treesitter/playground'
    " Plug 'kyazdani42/nvim-tree.lua' " lua的目录浏览
    " Plug 'romgrk/nvim-treesitter-context'
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()

    Plug 'norcalli/nvim-colorizer.lua' " 最好把插件内的lua文件同步到bin/lua下
    lua require'colorizer'.setup()

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'

    " Plug 'neovim/nvim-lspconfig'
    " Plug 'kabouzeid/nvim-lspinstall'
    " Plug 'alexaandru/nvim-lspupdate'
    " Plug 'nvim-lua/completion-nvim' " 自动完成
    " Plug 'steelsojka/completion-buffers'
    " Plug 'nvim-treesitter/completion-treesitter'
    " Plug 'kristijanhusak/vim-dadbod-completion'
    " " 在每一个buffer都自动完成
    " autocmd BufEnter * lua require'completion'.on_attach()
    " let g:completion_trigger_keyword_length = 2 " default = 1
    " let g:completion_timer_cycle = 200 "default value is 80
    " Plug 'norcalli/snippets.nvim'
    " let g:completion_enable_snippet = 'snippets.nvim'
    " Plug 'glepnir/indent-guides.nvim' " 基于lua的对齐线

    " Plug 'yggdroot/leaderf'" 依赖python
    " Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'puremourning/vimspector' "可视化debug
    " Plug 'tadaa/vimade' " 聚焦当前操作窗口,但在%s做替换时有bug
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
    let g:Hexokinase_highlighters = ['foregroundfull']
    " Plug 'sheerun/vim-polyglot' " 多语言的代码高亮集成包, markdown语法显示有问题
    " Plug 'octol/vim-cpp-enhanced-highlight'
endif
" Plug 'mattn/emmet-vim', { 'for': 'html' } "html快捷生成代码块,已经用了coc
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'],
  \ 'do': 'make install'
  \}
Plug 'Quramy/vim-js-pretty-template', { 'for': ['javascript-jsx', 'typescript-tsx'] } "高亮jsx结构
Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript-jsx', 'typescript-tsx'] } "jsx语法缩进
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'janko-m/vim-test' "测试工具
" 多光标
Plug 'mg979/vim-visual-multi'
Plug 'terryma/vim-multiple-cursors'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'aloussase/cyberpunk'
Plug 'jiangmiao/auto-pairs' "符号补全,当前使用了coc-pairs
Plug 'matze/vim-move' " 代码块移动
" Plug 'rhysd/accelerated-jk' " 加速jk移动
" nmap j <Plug>(accelerated_jk_gj)
" nmap k <Plug>(accelerated_jk_gk)
Plug 'alvan/vim-closetag' "自动闭合标签
Plug 'luochen1990/rainbow' "彩虹符号匹配
Plug 'ianva/vim-youdao-translater' "有道翻译
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
Plug 'kristijanhusak/vim-carbon-now-sh' "代码块生成图片
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth' "自适应配置缓冲选项
Plug 'nicwest/vim-http', {'on': 'Http'} "配置http请求
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
Plug 'mzlogin/vim-markdown-toc'
" 专注阅读
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
\ | Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
Plug 'gpanders/vim-medieval', {'for': 'markdown'}  "评估markdown代码块
" Plug 'jceb/vim-orgmode', {'for': 'org'}
" let g:org_agenda_files = ['~/org/index.org']
" let g:org_aggressive_conceal = 1
" let g:org_heading_shade_leading_stars = 1
" let g:org_todo_keywords = ['TODO', 'WIP', 'REVIEW', '|', 'DONE', 'CANCELLED']
" let g:org_indent = 1
Plug 'uguu-org/vim-matrix-screensaver', {'on': 'Matrix'} "黑客帝国的屏保
Plug 'skywind3000/asynctasks.vim' "任务
Plug 'skywind3000/asyncrun.vim'
" Plug 'metakirby5/codi.vim', {'on': 'Codi'} "代码执行预览,只支持linux
" Plug 'michaelb/sniprun' " 运行代码块,仅linux
Plug 'thinca/vim-quickrun'
Plug 'christoomey/vim-conflicted'
Plug 'chrisbra/vim-diff-enhanced'
" Plug 'tommcdo/vim-exchange'
Plug 'brooth/far.vim' " 全局替换插件 Plug 'markonm/traces.vim' Plug 'neomake/neomake'
Plug 'tracyone/neomake-multiprocess'
Plug 'ronakg/quickr-preview.vim'
" Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'} " 关闭buffer而不关闭窗口
" 平滑滚动
" Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-apathy' " 加强版的 go to file
" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
" Plug 'andrewradev/linediff.vim' "行代码的对比
" Plug 'valloric/matchtagalways'
" Plug 'andymass/vim-matchup' " 高亮匹配语句
Plug 'tpope/vim-characterize' "ga显示光标下 Unicode 字符的名称、代码点值和十六进制值
" Plug 'machakann/vim-swap' "交换参数, g>或g<
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
Plug 'mbbill/undotree'
Plug 'tpope/vim-dadbod' | Plug 'kristijanhusak/vim-dadbod-ui' | Plug 'kristijanhusak/vim-dadbod-completion' " 数据库
Plug 'tpope/vim-sensible' "合适的默认配置
Plug 'tpope/vim-unimpaired' "符号映射
Plug 'tpope/vim-scriptease'
" tmux相关插件
" if executable("tmux") && strlen($TMUX)
"     " tmux与vim窗口间导航
"     Plug 'christoomey/vim-tmux-navigator'
"     " tmux.conf set -g focus-events on
"     Plug 'tmux-plugins/vim-tmux-focus-events'
"     " 在tmux和vim之间进行复制与粘贴
"     Plug 'roxma/vim-tmux-clipboard'
"     " tmux补全插件
"     Plug 'wellle/tmux-complete.vim'
" endif

call plug#end()

" autocmd VimEnter * PlugClean! | PlugUpdate --sync

filetype plugin indent on  " 根据侦测到的不同类型加载对应的插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 加载插件配置
for f in split(glob('$VIMPATH/vimrc/plugins/*.vim'), '\n')
    exe 'source' f
endfor

