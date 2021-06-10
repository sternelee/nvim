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
  -- use { 'liuchengxu/vim-clap' }
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
  use {
    'nvim-telescope/telescope-media-files.nvim',
    config = function()
      require"telescope".extensions.media_files.media_files()
    end
  }
  use {
    'nvim-telescope/telescope-dap.nvim',
    config = function()
      require"telescope".load_extension("dap")
    end
  }
  use {
    'nvim-telescope/telescope-bookmarks.nvim',
    config = function()
      require"telescope".load_extension("bookmarks")
    end
  }
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
  -- use { 'tzachar/compe-tabnine', requires = 'hrsh7th/nvim-compe'}
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

  use 'mfussenegger/nvim-dap' -- 程序调试
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
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
  --[[ use { 'vhyrro/neorg', requires = { 'nvim-lua/plenary.nvim' }, config = function()

  	require('neorg').setup {
  		load = {
  			["core.defaults"] = {}, -- Load all the default modules
  			["core.norg.concealer"] = {} -- Enhances the text editing experience by using icons
  		},

  		-- Tells neorg where to load community provided modules. If unspecified, this is the default
  		community_module_path = vim.fn.stdpath("cache") .. "/neorg_community_modules"
  	}
  end} ]]
end)
