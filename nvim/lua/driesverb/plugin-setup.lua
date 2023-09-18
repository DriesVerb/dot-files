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

require("lazy").setup({

  -- plugin needed by other plugins 
	{ "nvim-lua/plenary.nvim" },

  -- file explorer
	{ "nvim-tree/nvim-tree.lua" },

  -- status line
	{ "nvim-lualine/lualine.nvim" },

	-- undo tree
  { "mbbill/undotree" },

  -- telescope - fuzzy finder
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "axelvc/template-string.nvim" },

  -- lsp package manager
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    config = function()
      require("mason").setup()
    end,
  },

 -- {'jayp0521/mason-null-ls.nvim'},
  {"williamboman/mason-lspconfig.nvim"},

  { "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").setup(
        { ui = {
          sign = false
        }
        })
    end,
  },

  -- autoclose
  {'windwp/nvim-ts-autotag',
    config = function()
      require("nvim-ts-autotag").setup()end,
 },

  -- additional functionality for typescript server (e.g. rename file & update imports
  { "jose-elias-alvarez/typescript.nvim" } ,

   -- lsp 
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "driesverb.plugins.lsp"
    end,
    dependencies = {
      -- formatting , linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "driesverb.plugins.null-ls"
        end,
      },
    },
  },

  { 'MunifTanjim/prettier.nvim'} ,

  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      -- snippets
      --list of default snippets
      "rafamadriz/friendly-snippets",

      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      -- autopairs , autocompletes ()[] etc
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()

          --  cmp integration
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          local cmp = require "cmp"
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
    },
  },

  -- comments
         {   "numToStr/Comment.nvim",
   lazy = false},

  -- autopairs
  { "windwp/nvim-autopairs" },

  -- git signs
  { "lewis6991/gitsigns.nvim" },

  -- color scheme
  { "navarasu/onedark.nvim" },

	-- vs-code like icons
  { "nvim-tree/nvim-web-devicons" },

  -- splash screen
  { "goolord/alpha-nvim" },

  -- Navigate between panes
  { "christoomey/vim-tmux-navigator" },

  -- Maximize & Restore current windows
  { "szw/vim-maximizer" },
})
