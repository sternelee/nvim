" 插件安装
" 需要使用Scoop(或chcoc)全局安装 ctags, fzf, maple, ripgrep, bat, fd

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'
set completeopt=menuone,noselect
set shortmess+=c " 禁止在下方显示一些啰嗦的提示
Plug 'liuchengxu/vista.vim'
let g:vista_default_executive = 'coc'
Plug 'skywind3000/asynctasks.vim' "任务
Plug 'skywind3000/asyncrun.vim'
" Plug 'tpope/vim-dispatch', {'on': 'Dispatch'} "异步执行make和test
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vim-which-key' "显示leader快捷键
Plug 'junegunn/vim-easy-align' "代码对齐
" git插件
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'lambdalisue/gina.vim'
Plug 'itchyny/lightline.vim' "状态栏显示
Plug 'mgee/lightline-bufferline' "状态栏buffer快捷导航
Plug 'itchyny/vim-gitbranch'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim', { 'on': 'PomodoroStart' } "番茄时钟
Plug 'haya14busa/incsearch.vim' "增强/文字搜索
Plug 'sickill/vim-pasta'
Plug 'konfekt/fastfold' "性能更好的语法折叠
Plug 'tpope/vim-surround' "匹配符号快捷操作
Plug 'terryma/vim-expand-region' "扩大缩小选择区域
Plug 'airblade/vim-rooter'
" 显示文件图标
Plug 'ryanoasis/vim-devicons'
" Plug 'leafoftree/vim-vue-plugin'
Plug 'moll/vim-node', {'for': ['javascript', 'typescript']}
if has('nvim')
    " https://github.com/glepnir/nvim-lua-guide-zh
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "性能更好的语法高亮,需要night版本,建议更新完后把lua文件同步到nvim的lua目录下
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'nvim-treesitter/playground'
    " Plug 'romgrk/nvim-treesitter-context'
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    " Telescope, 搜索grep工具
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'
    Plug 'phaazon/hop.nvim'
    map  <Leader>w :HopWord<CR>
    map  <Leader>l :HopLine<CR>
    map  <Leader>/ :HopPattern<CR>
    " Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'} " 显示markdown preview
    Plug 'norcalli/nvim-colorizer.lua' " 颜色值显示,最好把插件内的lua文件同步到bin/lua下
    lua require'colorizer'.setup()
else
    Plug 'easymotion/vim-easymotion' " 基于字母的光标快速移动
    Plug 'justinmk/vim-sneak' "双字母选择的光标移动
    let g:sneak#label = 1
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
    let g:Hexokinase_highlighters = ['foregroundfull']
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
" 操作与编辑
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'matze/vim-move' " 代码块移动
Plug 'alvan/vim-closetag' "自动闭合标签
Plug 'luochen1990/rainbow' "彩虹符号匹配
Plug 'yggdroot/indentline' " 对齐线
Plug 'voldikss/vim-translator'  " npm install fanyi -g 安装翻译
Plug 'junegunn/vim-peekaboo' "查看历史的复制和删除的寄存器, @或\" 触发
Plug 'tpope/vim-eunuch' " 加强的目录和文件编辑
Plug 'troydm/zoomwintab.vim' " 最大化窗口，ctrl w o
Plug 'mhinz/vim-hugefile'
Plug 'tpope/vim-repeat' "重复命令操作
Plug 'ntpeters/vim-better-whitespace' "显示多余空格
Plug 'mhinz/vim-startify' "启动界面预览
Plug 'kristijanhusak/vim-carbon-now-sh' "代码块生成图片
Plug 'editorconfig/editorconfig-vim'
Plug 'nicwest/vim-http', {'on': 'Http'} "配置http请求
Plug 'tpope/vim-commentary' "快捷代码注释
" 生成注释文档
Plug 'asins/vimcdoc' "中文文档计划
set helplang=cn
" Plug 'pechorin/any-jump.vim' "跳转到函数定义
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug', 'vimwiki'], 'on': 'MarkdownPreview'}
Plug 'mzlogin/vim-markdown-toc'
" 专注阅读
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
\ | Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'hotoo/pangu.vim', {'for': 'markdown'}
Plug 'uguu-org/vim-matrix-screensaver', {'on': 'Matrix'} "黑客帝国的屏保
Plug 'lfv89/vim-interestingwords' " 高亮标记单词
let g:interestingWordsRandomiseColors = 1
Plug 'thinca/vim-quickrun'
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

call plug#end()

" autocmd VimEnter * PlugClean! | PlugUpdate --sync

filetype plugin indent on  " 根据侦测到的不同类型加载对应的插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 加载插件配置
for f in split(glob('$VIMPATH/nvim/plugins/*.vim'), '\n')
    exe 'source' f
endfor

