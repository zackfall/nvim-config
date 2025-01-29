function n_keymap(keymap, command, desc)
  vim.keymap.set("n", keymap, command, { desc = desc })
end

function i_keymap(keymap, command, desc)
  vim.keymap.set("i", keymap, command, { desc = desc })
end

n_keymap('<S-l>', '<cmd>Lazy<cr>', 'Open Lazy')
n_keymap('<leader>so', '<cmd>so %<cr>', 'Reload the config')

-- Oil Keybinding: {{{
--
n_keymap("-", "<CMD>Oil<CR>", "Open parent directory")
-- keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--
-- }}}

-- Telescope Keybinding: {{{
--
local telescope = require('telescope.builtin')

n_keymap('<leader>ff',
  function()
    telescope.find_files(require('telescope.themes').get_ivy({
      sort_mru = true,
      sort_lastused = false,
      layout_config = {
        preview_width = 0.45
      }
    }))
  end,
  'Telescope find files')
n_keymap('<leader>fg', telescope.live_grep, 'Telescope live grep')
n_keymap('<leader>fb', telescope.buffers, 'Telescope buffers')
n_keymap('<leader>fh', telescope.help_tags, 'Telescope help tags')
n_keymap(
  '<S-h>',
  function ()
    require('telescope.builtin').buffers(require('telescope.themes').get_ivy({
      sort_mru = true,
      sort_lastused = false,
      initial_mode = 'normal',
      layout_config = {
        preview_width = 0.45
      }
    }))
  end,
  'Open a view of all buffers'
)
--
-- }}}

-- Snacks Keybinding: {{{
--
n_keymap('<leader>sbd', function () Snacks.bufdelete("%") end, 'Delete the current buffer')
n_keymap('<leader>sbl', '<cmd>lua Snacks.git.blame_line()<cr>', 'Show git log for the current line')
n_keymap('<leader>snh', '<cmd>lua Snacks.notifier.show_history()<cr>', 'Shows notifications history')
--
-- }}}

-- Neogit Keybinding: {{{
--
local neogit = require('neogit')
n_keymap('<leader>ng', neogit.open, 'Open Neogit')
n_keymap('<leader>nl', "<CMD>Neogit log<CR>", 'Open Logs')
n_keymap('<leader>nb', "<CMD>Neogit branch<CR>", "Open branch")
--
-- }}}

-- Utility Keybinding: {{{
--
n_keymap('<leader>q', '<cmd>q<cr>', 'Quit neovim')
n_keymap('<leader>w', '<cmd>w<cr>', 'Save current buffer')
local ufo = require('ufo')
n_keymap('zR', ufo.openAllFolds, 'Open All folds')
n_keymap('zM', ufo.closeAllFolds, 'Closes All folds')
n_keymap('zr', ufo.openFoldsExceptKinds, 'Open All folds except kinds')
n_keymap('zm', ufo.closeFoldsWith, 'Closes All folds')
n_keymap('ñ', function ()
  ufo.peekFoldedLinesUnderCursor()
end)
vim.keymap.set({ 'n', 'v' }, 'gh', '^', { desc = 'Go to the beginning line' })
vim.keymap.set({ 'n', 'v' }, 'gl', '$', { desc = 'Go to the end of the line' })

-- Function to navigate windows inside neovim
local function navigate_window(direction)
  return function ()
    if vim.fn.mode() == "1" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><C-w>" .. direction, true, false, true), "n", true)
    else
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>" .. direction, true, false, true), "n", true)
    end
  end
end
vim.keymap.set({ "n", "i" }, "<C-h>", navigate_window("h"), { desc = "Go to Left windows", remap = false })
vim.keymap.set({ "n", "i" }, "<C-j>", navigate_window("j"), { desc = "Go to Lower windows", remap = false })
vim.keymap.set({ "n", "i" }, "<C-k>", navigate_window("k"), { desc = "Go to Upper windows", remap = false })
vim.keymap.set({ "n", "i" }, "<C-l>", navigate_window("l"), { desc = "Go to Right windows", remap = false })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up in visual mode" })

vim.keymap.set("n", "J", "mzJ`z")
n_keymap('<leader>h', ':nohlsearch<CR>', 'Stop searching')
--
-- }}}

-- Insert Keybinding: {{{
--
i_keymap('jj', '<Esc>', 'Exit Insert mode')
--- }}}
