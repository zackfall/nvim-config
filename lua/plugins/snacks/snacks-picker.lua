-- TODO: Configure Picker
---@module 'snacks'
---@type snacks.picker.Config
return {
  enabled = true,
  matcher = {
    sort_empty = true,
    frecency = true,
  },
  layout = {
    preview = "main",
    select = {
      layout = {
        box = "vertical",
        backdrop = false,
        width = 0,
        height = 0.4,
        position = "bottom",
        border = "top",
        title = " {title} {live} {flags}",
        title_pos = "left",
        { win = "input", height = 1, border = "bottom" },
        {
          box = "horizontal",
          { win = "list",    border = "none" },
          { win = "preview", title = "{preview}", width = 0.6, border = "left" },
        },
      },
    }
  },
  ---@type snacks.picker.files.Config
  files = {
    finder = "files",
    format = "file",
    show_empty = true,
    hidden = true,
    ignored = false,
    follow = true,
    supports_live = true
  }
}
