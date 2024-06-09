-- Create a custom filename component that change colors if the file is saved or not
local custom_fname = require('lualine.components.filename'):extend()
local highlight = require 'lualine.highlight'
local default_status_colors = { saved = '#a6e3a1', modified = '#f38ba8' }

function custom_fname:init(options)
  custom_fname.super.init(self, options)
  self.status_colors = {
    saved = highlight.create_component_highlight_group(
      { fg = default_status_colors.saved }, 'filename_status_saved', self.options),
    modified = highlight.create_component_highlight_group(
      { fg = default_status_colors.modified }, 'filename_status_modified', self.options),
  }
  if self.options.color == nil then self.options.color = '' end
end

function custom_fname:update_status()
  local data = custom_fname.super.update_status(self)
  data = highlight.component_format_highlight(vim.bo.modified
    and self.status_colors.modified
    or self.status_colors.saved) .. data
  return data
end

-- Using gitsigns instead of lualine default diff
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local virtual_env = function()
  if vim.bo.filetype ~= 'python' then
    return ""
  end

  local conda_env = os.getenv('CONDA_DEFAULT_ENV')
  local venv_path = os.getenv('VIRTUAL_ENV')

  if venv_path == nil then
    if conda_env == nil then
      return ""
    else
      return string.format("  %s (conda)", conda_env)
    end
  else
    local venv_name = vim.fn.fnamemodify(venv_path, ':t')
    return string.format("  %s (venv)", venv_name)
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      {
        'FugitiveHead',
        icon = ''
      },
      {
        'diff',
        source = diff_source
      },
      'diagnostics',
    },
    lualine_c = {
      custom_fname,
      {
        virtual_env,
        color = { fg = '#74c7ec' }
      }
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { custom_fname },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "fugitive" }
}
