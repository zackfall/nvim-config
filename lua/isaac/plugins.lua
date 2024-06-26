local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'RRethy/vim-illuminate',
  'j-hui/fidget.nvim',
  'stevearc/conform.nvim',
  'norcalli/nvim-colorizer.lua',
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'xiyaowong/transparent.nvim',
  'onsails/lspkind.nvim',
  'nvim-lualine/lualine.nvim',
  'nanotee/sqls.nvim',
  'mfussenegger/nvim-lint',
  'Exafunction/codeium.vim',
  'windwp/nvim-ts-autotag',
  'akinsho/bufferline.nvim',
  'folke/todo-comments.nvim',
  { 'catppuccin/nvim',       name = 'catppuccin', priority = 1000 },
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end
  },
  {
    'NeogitOrg/neogit',
    branch = "master",
    dependencies = {
      'nvim-lua/plenary.nvim',  -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
    },
    config = true
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {}
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp'
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        enabled = true,
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    },
  },
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim'
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'epwalsh/obsidian.nvim',
    version = "*",
    lazy = true,
    ft = "markdown"
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  { 'wakatime/vim-wakatime', lazy = false },
})
