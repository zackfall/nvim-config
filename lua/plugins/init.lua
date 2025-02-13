return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1001,
    opts = {
      rocks= { 'magick' }
    }
  },
  {
    'OXY2DEV/helpview.nvim',
    lazy = false, -- Recommended

    dependencies = {
        'nvim-treesitter/nvim-treesitter'
    }
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  { 'lewis6991/gitsigns.nvim', opts = {} },
}
