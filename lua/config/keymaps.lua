function n_keymap(keymap, command, desc)
  vim.keymap.set("n", keymap, command, { desc = desc })
end

function i_keymap(keymap, command, desc)
  vim.keymap.set("i", keymap, command, { desc = desc })
end

n_keymap('<S-l>', '<cmd>Lazy<cr>', 'Open Lazy')
n_keymap('<leader>so', '<cmd>so %<cr>', 'Reload the config')

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
n_keymap('<leader>nl', "<CMD>Neogit log<CR>", 'Open Logs')
n_keymap('<leader>nb', "<CMD>Neogit branch<CR>", "Open branch")

-- Utility Keybinding
--
n_keymap('<leader>q', '<cmd>q<cr>', 'Quit neovim')
n_keymap('<leader>w', '<cmd>w<cr>', 'Save current buffer')
local ufo = require('ufo')
n_keymap('zR', ufo.openAllFolds, 'Open All folds')
n_keymap('zM', ufo.closeAllFolds, 'Closes All folds')
n_keymap('zr', ufo.openFoldsExceptKinds, 'Open All folds except kinds')
n_keymap('zm', ufo.closeFoldsWith, 'Closes All folds')
n_keymap('K', function ()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

-- Insert Keybinding
--
i_keymap('jj', '<Esc>', 'Exit Insert mode')
