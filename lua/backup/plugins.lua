-- vim.cmd [[packadd packer.nvim]]
-- vim._update_package_paths()
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  -- Color scheme
  use { 'sainnhe/gruvbox-material' }
  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }
  -- use {
  --   'hrsh7th/nvim-compe',
  --   opt = true,
  --   requires = {
  --     {'hrsh7th/vim-vsnip', opt = true},
  --     {'hrsh7th/vim-vsnip-integ', opt = true},
  --     {'tzachar/compe-tabnine', opt = true}
  --   }
  -- }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- Lua development
  use { 'tjdevries/nlua.nvim' }
  -- Vim dispatch
  use { 'tpope/vim-dispatch' }
  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

end)
