return {
  'folke/snacks.nvim',
  priority=1000,
  dependencies = { {"folke/persistence.nvim", event = "BufReadPre", opts = {}} },
  opts = {
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
      enabled = true,
      easing = "linear",
      fps = 60
    },
    ---@class snacks.bufdelete.Opts
    ---@field buf? number Buffer to delete. Defaults to the current buffer
    ---@field force? boolean Delete the buffer even if it is modified
    ---@field filter? fun(buf: number): boolean Filter buffers to delete
    ---@field wipe? boolean Wipe the buffer instead of deleting it (see `:h :bwipeout`)
    bufdelte = {
      enabled = true
    }
  },
}
