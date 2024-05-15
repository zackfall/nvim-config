local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      -- preview_width = 0.65,        FIX: I don't know whats wrong with this.
      horizontal = {
        size = {
          width = '95%',
          height = '95%',
        }
      }
    },
    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
      },
    }
  },
  pickers = {
    find_files = {
      theme = 'dropdown'
    }
  },
}

require("telescope").load_extension('cmdline')
