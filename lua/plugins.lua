local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local h = require('helpers')
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Install here
lazy.setup({
  -- Common dependencies
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Colorschemes
  {
    'catppuccin/nvim',
    name = 'catppucin'
  },

  -- Notifications
  'rcarriga/nvim-notify',

  -- Buffer closer
  'moll/vim-bbye',

  -- Buffer selector
  'matbme/JABS.nvim',

  -- File nav
  'ThePrimeagen/harpoon',

  -- File explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'muniftanjim/nui.nvim'
    }
  },

  -- Bufferline
  'akinsho/bufferline.nvim',

  -- Lualine
  'nvim-lualine/lualine.nvim',

  --Telescope
  'nvim-telescope/telescope.nvim',

  -- GIT handler
  'lewis6991/gitsigns.nvim',

  -- Color highlighter
  'norcalli/nvim-colorizer.lua',

  -- Code commentator
  'numToStr/Comment.nvim',

  -- Preview markdown with glow
  'ellisonleao/glow.nvim',

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = { ':TSUpdate' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },

  --LSP
  'neovim/nvim-lspconfig',           -- Easier LSP config
  'tami5/lspsaga.nvim',
  'onsails/lspkind.nvim',            -- LSP icons
  'jose-elias-alvarez/null-ls.nvim', -- Misc. extras
  {
    dir = "~/Projects/toelsp.nvim"
  },

  -- Autocomplete with LSP and luasnip
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',

      'saadparwaiz1/cmp_luasnip',
      'l3mon4d3/luasnip',
    }
  },
})
