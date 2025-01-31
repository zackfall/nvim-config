local dashboard = require('plugins.snaks.snacks-dashboard')
local zen = require('plugins.snaks.snacks-zen')
local input = require('plugins.snaks.snacks-input')

return {
  'folke/snacks.nvim',
  priority = 1000,
  dependencies = { { 'folke/persistence.nvim', event = 'BufReadPre', opts = {} } },
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
    bigfile = {
      enabled = true,
      notify = true,
      size = 1.5 * 1024 * 1024
    },
    animate = {
      duration = 20,
      easing = 'linear',
      fps = 60
    },
    -- TODO: Configure Picker
    picker = {
      enabled = true,
      matcher = {
        sort_empty = true,
        frecency = true
      },
      layout = {
        preset = 'ivy',
        preview = 'main'
      }
    },
    dashboard = dashboard,
    zen = zen,
    input = input
  }
}
