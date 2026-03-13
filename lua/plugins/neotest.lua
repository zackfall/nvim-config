return {
  {
    "rionabyssor/FAAAH-on-fail",
    config = function()
      require("FAAAH-on-fail").setup({})
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      'nvim-neotest/neotest-python'
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('neotest').setup({
        adapters = {
          require('rustaceanvim.neotest'),
          require('neotest-python'),
        },
        consumers = {
          FAHonfail = require("FAAAH-on-fail").consumer
        }
      })
    end,
    keys = {
      { '<leader>tt', '<cmd>Neotest run<cr>',  desc = 'Run test/s' },
      { '<leader>ts', '<cmd>Neotest stop<cr>', desc = 'Stop test/s' }
    }
  }
}
