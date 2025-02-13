return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-media-files.nvim' },
  config = function ()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        require('telescope').setup({
          pickers = {
            find_files = {
              find_command = { 'rg', '--files', '--sortr=modified' }
            }
          }
        }),
        path_display = {
          filename_first = {
            reverse_directories = true,
          }
        },
        mappings = {
          n = {
            ['d'] = require('telescope.actions').delete_buffer,
            ['q'] = require('telescope.actions').close
          }
        }
      }
    })
    telescope.load_extension('media_files')
  end,
}
