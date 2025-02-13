return {
  "nvim-neotest/neotest",
  dependencies = {
    "antoinemadec/FixCursorHold.nvim",
    'nvim-neotest/neotest-python'
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('neotest').setup({
      adapters = {
        require('rustaceanvim.neotest'),
        require('neotest-python'),
      }
    })
  end,
  keys = {
    { '<leader>tt', '<cmd>Neotest run<cr>', desc = 'Run test/s' },
    { '<leader>ts', '<cmd>Neotest stop<cr>', desc = 'Stop test/s' }
  }
}
