return {
  { "lewis6991/gitsigns.nvim",            opts = {} },
  { "github/copilot.vim" },
  { 'norcalli/nvim-colorizer.lua',        opts = {} },
  { "xiyaowong/transparent.nvim" },
  -- { "wakatime/vim-wakatime" },
  { "brenoprata10/nvim-highlight-colors", opts = {} },
  {
    "OXY2DEV/helpview.nvim",
    lazy = false, -- Recommended

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup({})
    end,
  },
  {
    "niuiic/code-shot.nvim",
    dependencies = "niuiic/omega.nvim",
  },
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', opts = {} },
  {
    'AckslD/swenv.nvim',
    config = function()
      require("swenv").setup({
        get_venvs = function(venvs_path)
          return require('swenv.api').get_venvs(venvs_path)
        end,
        venvs_path = vim.fn.expand("/home/rion/.pyenv/versions/")
      })
    end
  }
}
