local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local h = require("helpers")
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install here
lazy.setup({
  -- Common dependencies
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",

  -- Colorschemes
  {
    "catppuccin/nvim",
    name = "catppucin"
  },

  -- Main UI
  "folke/noice.nvim",

  -- Quickfix UI
  "stevearc/quicker.nvim",

  -- Notifications
  "rcarriga/nvim-notify",


  -- Project quicknav
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "muniftanjim/nui.nvim"
    }
  },

  -- Lualine for status and bufferlines
  "nvim-lualine/lualine.nvim",

  --Telescope
  "nvim-telescope/telescope.nvim",

  -- UI Core hooks replacement
  "stevearc/dressing.nvim",

  -- GIT handler
  "lewis6991/gitsigns.nvim",

  -- Color highlighter
  "norcalli/nvim-colorizer.lua",

  -- Code commentator
  "numToStr/Comment.nvim",

  -- Preview markdown with glow
  "ellisonleao/glow.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = { ":TSUpdate" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  --LSP
  "neovim/nvim-lspconfig",           -- Easier LSP config
  "onsails/lspkind.nvim",            -- LSP icons
  "nvimtools/none-ls.nvim",

  -- Autocomplete with LSP and luasnip
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",

      "saadparwaiz1/cmp_luasnip",
      "l3mon4d3/luasnip",
    }
  },

  -- Dropbar
  "Bekaboo/dropbar.nvim",

  -- Tmux integration
  "alexghergh/nvim-tmux-navigation",
})
