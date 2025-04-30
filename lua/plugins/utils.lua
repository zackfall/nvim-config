return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("neotest").setup({
        adapters = {
          require("rustaceanvim.neotest"),
          require("neotest-python"),
          require("neotest-golang"),
          require("neotest-zig"),
          require("neotest-jest"),
        },
      })
    end,
  },
}
