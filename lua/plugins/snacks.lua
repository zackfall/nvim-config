return {
  'folke/snacks.nvim',
  priority=1000,
  dependencies = { {"folke/persistence.nvim", event = "BufReadPre", opts = {}} },
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    bufdelte = { enabled = true },
    scope = { enabled = true },
    dim = { enabled = true },
    indent = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    dashboard = {
      preset = {
        header = [[
███████╗ █████╗  ██████╗ ██████╗ ██████╗ ███████╗
╚══███╔╝██╔══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝
  ███╔╝ ███████║██║     ██║   ██║██║  ██║█████╗  
 ███╔╝  ██╔══██║██║     ██║   ██║██║  ██║██╔══╝  
███████╗██║  ██║╚██████╗╚██████╔╝██████╔╝███████╗
╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]],
      },
      sections = {
        {section = "header"},
        {
          pane = 2,
          section = "terminal",
          cmd = "pokemon-colorscripts -n pikachu --no-title; sleep .1",
          height = 10,
          indent = 20,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section= "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          tt1 = 5 * 60,
          indent = 3,
        },
        {section = "startup"}
      }
    },
    bigfile = {
      notify = true,
      size = 1.5 * 1024 * 1024,
    },
    animate = {
      duration = 20, -- ms/s
      easing = "linear",
      fps = 60
    },
    zen = {
      enter = true,
      fixbuf = false,
      minimal = false,
      width = 120,
      height = 0,
      backdrop = { transparent = true, blend = 40 },
      keys = { q = false },
      zindex = 40,
      wo = {
        winhighlight = "NormalFloat:Normal",
      },
    },
    input = {
      backdrop = false,
      position = "float",
      border = "rounded",
      title_pos = "center",
      height = 1,
      width = 60,
      relative = "editor",
      noautocmd = true,
      row = 2,
      -- relative = "cursor",
      -- row = -3,
      -- col = 0,
      wo = {
        winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
        cursorline = false,
      },
      bo = {
        filetype = "snacks_input",
        buftype = "prompt",
      },
      --- buffer local variables
      b = {
        completion = true, -- disable blink completions in input
      },
      keys = {
        n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
        i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
        i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = "i", expr = true },
        i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
        i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
        i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
        i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
        q = "cancel",
      },
    },
    -- TODO: Configure Picker
    picker = {
      enabled = true,
      matcher = {
        sort_empty = true,
        frecency = true
      },
      layout = {
        preview = 'main',
        preset = 'ivy'
      },
    },
  },
}
