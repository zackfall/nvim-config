return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      "lazy.nvim",
      "snacks.nvim",
      "blink.cmp"
    },
    enabled = function(root_dir)
      return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
    end
  }
}
