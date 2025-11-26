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
}
