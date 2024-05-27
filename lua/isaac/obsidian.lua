local ob = require("obsidian")

ob.setup({
  workspaces = {
    {
      name = "Universidad",
      path = "/mnt/c/Users/Zack/Documents/notes/universidad",
    },
    {
      name = "Personal",
      path = "/mnt/c/Users/Zack/Documents/notes/personal",
    }
  },
  mappings = {
    ["<leader>ch"] = {
      action = function()
        return ob.util.toggle_checkbox()
      end,
      opts = { buffer = true }
    },
    ["<cr>"] = {
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true }
    }
  }
})
