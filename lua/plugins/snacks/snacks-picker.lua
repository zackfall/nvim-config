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
    preset = "ivy",
    preview = "main",
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
