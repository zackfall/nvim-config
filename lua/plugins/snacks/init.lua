local dashboard = require("plugins.snacks.snacks-dashboard")
local zen = require("plugins.snacks.snacks-zen")
local input = require("plugins.snacks.snacks-input")
local picker = require("plugins.snacks.snacks-picker")

return {
  "folke/snacks.nvim",
  priority = 1000,
  dependencies = { { "folke/persistence.nvim", event = "BufReadPre", opts = {} } },
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    bufdelete = { enabled = true },
    scope = { enabled = true },
    dim = { enabled = true },
    indent = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    image = { enabled = true },
    bigfile = {
      enabled = true,
      notify = true,
      size = 1.5 * 1024 * 1024,
    },
    animate = {
      duration = 20,
      easing = "linear",
      fps = 60,
    },
    picker = picker,
    dashboard = dashboard,
    zen = zen,
    input = input,
  },
}
