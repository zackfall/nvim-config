function n_keymap(keymap, command, desc)
  vim.keymap.set("n", keymap, command, { desc = desc })
end

-- Oil Keybinding
--
n_keymap("-", "<CMD>Oil<CR>", "Open parent directory")
-- keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope Keybinding
--
local telescope = require('telescope.builtin')
n_keymap('<leader>ff', telescope.find_files, 'Telescope find files')
n_keymap('<leader>fg', telescope.live_grep, 'Telescope live grep')
n_keymap('<leader>fb', telescope.buffers, 'Telescope buffers')
n_keymap('<leader>fh', telescope.help_tags, 'Telescope help tags')

-- Neogit Keybinding
--
local neogit = require('neogit')
n_keymap('<leader>ng', neogit.open, 'Open Neogit')
