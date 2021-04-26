vim.cmd [[packadd packer.nvim]]
-- vim._update_package_paths()
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'hrsh7th/nvim-compe',
    opt = true,
    requires = {
      {'hrsh7th/vim-vsnip', opt = true},
      {'hrsh7th/vim-vsnip-integ', opt = true},
      {'tzachar/compe-tabnine', opt = true}
    }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
