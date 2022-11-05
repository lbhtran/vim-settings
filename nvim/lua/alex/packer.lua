-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'vim-airline/vim-airline'
  use 'preservim/nerdcommenter'
  use 'jiangmiao/auto-pairs'
  use 'folke/tokyonight.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'terryma/vim-multiple-cursors'
  use {
    'nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
  }}
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  } 
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use({
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
		 }
	end,
  })
end)
