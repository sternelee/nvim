--Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

--setup packer
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- 状态栏
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use 'romgrk/barbar.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'glepnir/dashboard-nvim'
  -- git相关
  use 'TimUntersberger/neogit'
  use 'lewis6991/gitsigns.nvim'
  use 'lambdalisue/gina.vim'
  use 'kdheepak/lazygit.nvim'
  -- use 'ThePrimeagen/git-worktree.nvim'

  use 'kdav5758/TrueZen.nvim'
  use 'junegunn/limelight.vim'
  -- use 'yamatsum/nvim-cursorline'
  use 'norcalli/nvim-colorizer.lua' -- 色值高亮
  use 'shaunsingh/moonlight.nvim' -- theme
  use 'rktjmp/lush.nvim' -- 动态更新UI样式
  use 'npxbr/gruvbox.nvim'
  -- 语法高亮
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use  'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/playground'
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
  -- use 'lewis6991/spellsitter.nvim'
  -- 导航finder操作
  use 'mg979/vim-visual-multi'
  use 'phaazon/hop.nvim'
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
  use {
    'nvim-telescope/telescope-project.nvim',
    config = function()
      require"telescope".load_extension("project")
    end
  }
  --[[ use {
    'nvim-telescope/telescope-github.nvim',
    config = function()
      require"telescope".load_extension("gh")
    end
  } ]]
  --[[ use {
    'nvim-telescope/telescope-media-files.nvim',
    config = function()
      require"telescope".extensions.media_files.media_files()
    end
  } ]]
  --[[ use {
    'nvim-telescope/telescope-dap.nvim',
    config = function()
      require"telescope".load_extension("dap")
    end
  } ]]
  --[[ use {
    'nvim-telescope/telescope-bookmarks.nvim',
    config = function()
      require"telescope".load_extension("bookmarks")
    end
  } ]]
  use {
    'nvim-telescope/telescope-cheat.nvim',
    requires = 'tami5/sql.nvim',
    config = function()
      require"telescope".load_extension("cheat")
    end
  }
  -- use 'oberblastmeister/neuron.nvim' -- 笔记工具
  -- use 'vijaymarupudi/nvim-fzf'
  -- 补全和提示工具
  use 'hrsh7th/nvim-compe'
  use { 'tzachar/compe-tabnine', requires = 'hrsh7th/nvim-compe'}
  use 'onsails/lspkind-nvim'
  use 'neovim/nvim-lspconfig'
  use 'folke/lsp-trouble.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'simrat39/symbols-outline.nvim'
  -- use 'kabouzeid/nvim-lspinstall'
  use 'ray-x/lsp_signature.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- use 'nvim-lua/lsp_extensions.nvim'
  -- snippet相关
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'

  --[[ use 'mfussenegger/nvim-dap' -- 程序调试
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } ]]
  use 'akinsho/nvim-toggleterm.lua' -- 交互终端
  use 'kevinhwang91/nvim-hlslens'
  use 'tpope/vim-eunuch'
  use 'junegunn/vim-peekaboo' -- 查看历史的复制和删除的寄存器, @触发
  use 'tpope/vim-surround'
  use 'terryma/vim-expand-region' -- 扩大缩小选择区域
  use 'voldikss/vim-translator' -- npm install fanyi -g 安装翻译
  use 'b3nj5m1n/kommentary' -- 注释
  use 'alvan/vim-closetag'
  use 'ntpeters/vim-better-whitespace'
  use 'matze/vim-move'
  use 'tpope/vim-repeat'
  use 'plasticboy/vim-markdown'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  -- use 'npxbr/glow.nvim' -- Glow md文档预览
  use { 'junegunn/goyo.vim', ft = { 'markdown' } }
  use { 'uguu-org/vim-matrix-screensaver', cmd = 'Matrix' }
  use 'windwp/nvim-autopairs' -- 自动符号匹配
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  } -- 提示leader按键
  --[[ use {'pwntester/octo.nvim', config=function()
    require"octo".setup()
  end} -- 查看github issues ]]

  use 'sindrets/diffview.nvim' -- diff对比
  use 'p00f/nvim-ts-rainbow' -- 彩虹匹配
  use 'f-person/git-blame.nvim' -- 显示git message
  use 'lukas-reineke/format.nvim' -- 格式化
  use {
      'folke/todo-comments.nvim',
      config = function ()
          require('todo-comments').setup{}
      end
  }
  use 'konfekt/fastfold' -- 性能更好的语法折叠
  use {
      'NTBBloodbath/rest.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
  } -- 测试rest请求
  use 'ThePrimeagen/vim-be-good'
  use {
    'ahmedkhalf/lsp-rooter.nvim',
    config = function()
      require('lsp-rooter').setup {}
    end
  }
  use 'dstein64/vim-startuptime' -- nvim --startuptime time.log
  -- use 'ethanjwright/toolwindow.nvim'

end)

--make life easier
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

--gui
g.neovide_fullscreen = true
g.neovide_cursor_vfx_mode = "pixiedust"
vim.api.nvim_exec([[set guifont=VictorMono\ NF:h16]], false)

--theme
require('moonlight').set()

--settings
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4
cmd 'hi NORMAL guibg=#2f334d'
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noselect')           -- Completion options (for compe)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'scrolloff', 3 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'clipboard', 'unnamed')
opt('o', 'pumblend', 25 )
opt('o', 'scrolloff', 2 )
opt('o', 'tabstop', 2)
opt('o', 'shiftwidth', 2)
opt('o', 'softtabstop', 2)
opt('o', 'swapfile', false )
opt('o', 'showmode', false )
opt('o', 'background', 'dark' )
opt('o', 'backup', false )
opt('w', 'number', true)                              -- Print line number
opt('o', 'lazyredraw', false)
opt('o', 'signcolumn', 'yes')
opt('o', 'mouse', 'a')
opt('o', 'cmdheight', 1)
opt('o', 'wrap', false)
opt('o', 'relativenumber', true)
opt('o', 'hlsearch', true)
opt('o', 'inccommand', 'split')
opt('o', 'smarttab', true)
opt('o', 'incsearch', true)
opt('o', 'foldmethod', 'manual')

--opt('o', 'breakindent', true)
--opt('o', 'lbr', true)
--opt('o', 'formatoptions', 'l')

--set shortmess
vim.o.shortmess = vim.o.shortmess .. "c"

--mappings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

g.mapleader = " "                                                     --leader
map('i', 'jk', '<esc>')                                               --jk to exit
map('c', 'jk', '<C-C>')
map('n', ';', ':')                                                     --semicolon to enter command mode
map('n', 'j', 'gj')                                                    --move by visual line not actual line
map('n', 'k', 'gk')
map('n', 'q', '<cmd>q<CR>')
map('n', '<leader>w', '<cmd>HopWord<CR>')                              --easymotion/hop
map('n', '<leader>l', '<cmd>HopLine<CR>')
map('n', '<leader>/', '<cmd>HopPattern<CR>')
map('n', '<leader>p', '<cmd>Telescope<CR>')                   --fuzzy
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>')                   --fuzzy
map('n', '<leader>f', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fs', '<cmd>Telescope treesitter<CR>')
map('n', '<leader>fc', '<cmd>Telescope commands<CR>')
map('n', '<leader>fp', '<cmd>Telescope project<CR>')
map('n', '<leader>fm', '<cmd>Telescope marks<CR>')
map('n', '<leader>fe', '<cmd>e ~/.config/nvim/init.lua<CR>')
map('n', '<leader>z', '<cmd>TZAtaraxis<CR>')                           --ataraxis
map('n', '<leader>x', '<cmd>TZAtaraxis l45 r45 t2 b2<CR>')
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')                      --nvimtree
map('n', '<c-k>', '<cmd>wincmd k<CR>')                                 --ctrlhjkl to navigate splits
map('n', '<c-j>', '<cmd>wincmd j<CR>')
map('n', '<c-h>', '<cmd>wincmd h<CR>')
map('n', '<c-l>', '<cmd>wincmd l<CR>')
map('n', '<c-s>', '<cmd>w<CR>')
map('n', '<c-x>', '<cmd>BufferClose<CR>')
map('n', '<leader>b', '<cmd>BufferPick<CR>')
map('n', '<leader>bj', '<cmd>bprevious<CR>')
map('n', '<leader>bn', '<cmd>bnext<CR>')
map('n', '<leader>be', '<cmd>tabedit<CR>')
map('n', '<leader>ga', '<cmd>Gina add .<CR>')
map('n', '<leader>gm', '<cmd>Gina commit<CR>')
map('n', '<leader>gs', '<cmd>Gina status<CR>')
map('n', '<leader>gl', '<cmd>Gina pull<CR>')
map('n', '<leader>gu', '<cmd>Gina push<CR>')
cmd([[autocmd BufWritePre * %s/\s\+$//e]])                             --remove trailing whitespaces
cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

local numbers = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
for _, num in pairs(numbers) do
  map('n', '<leader>'..num, '<cmd>BufferGoto '..num..'<CR>')
end

-- general
g.loaded_python_provider = 0
-- g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

--visual multi
vim.api.nvim_exec([[
let g:VM_maps = {}
let g:VM_default_mappings = 0
let g:VM_maps["Add Cursor Down"] = '<A-j>'
let g:VM_maps["Add Cursor Up"] = '<A-k>'
]], false)

--indentline
g.indent_blankline_char = "▏"
g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

-- closetag
g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.js,*.jsx,*.vue'
g.closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.js'
g.closetag_emptyTags_caseSensitive = 1

g.better_whitespace_enabled = 0

-- fastfold
g.fastfold_savehook = 1
g.fastfold_fold_command_suffixes =  {'x','X','a','A','o','O','c','C'}
g.fastfold_fold_movement_commands = {']z', '[z', 'zj', 'zk'}
g.markdown_folding = 1
g.tex_fold_enabled = 1
g.vimsyn_folding = 'af'
g.xml_syntax_folding = 1
g.javaScript_fold = 1
g.sh_fold_enabled= 7
g.ruby_fold = 1
g.perl_fold = 1
g.perl_fold_blocks = 1
g.r_syntax_folding = 1
g.rust_fold = 1
g.php_folding = 1

--barbar
vim.api.nvim_exec([[
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.auto_hide = v:true
let bufferline.icons = 'both'
]], false)

require('kommentary.config').use_extended_mappings()

--nvim-compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    spell = false;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    tabnine = true;
  };
}

--spellsitter
-- require('spellsitter').setup()

-- setup for TrueZen.nvim
require("truezen")

--nvim treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"vue", "html", "javascript", "typescript", "css"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  }
}

--neogit
local neogit = require('neogit')
neogit.setup {}

--gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = false,  -- If luajit is present
}

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

require'diffview'.setup{}
-- require("dapui").setup()

require("lsp")

--evilline
require("evilline")

--colorizer
require'colorizer'.setup()

--nvimtree
g.nvim_tree_side = "left"
g.nvim_tree_width = 25
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git  = {
      unstaged = "",
      staged = "✓",
      unmerged = "",
      renamed = "",
      untracked = "",
      deleted = "",
      ignored = ""
      },
    folder  = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
      },
      lsp  = {
        hint = "",
        info = "",
        warning = "",
        error = "",
        }
}

--telescope
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    -- layout_strategy = "vertical",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = true,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    extensions = {
      --[[ bookmarks = {
        -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
        selected_browser = 'brave',
        url_open_command = 'open',
        url_open_plugin = nil,
        firefox_profile_name = nil,
      }, ]]
    }
  }
}

require("toggleterm").setup{}

--[[ require('neuron').setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
} ]]

require("dashboard")
