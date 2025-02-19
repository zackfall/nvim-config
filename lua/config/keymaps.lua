local function n_keymap(keymap, command, desc)
	vim.keymap.set("n", keymap, command, { desc = desc })
end

local function i_keymap(keymap, command, desc)
	vim.keymap.set("i", keymap, command, { desc = desc })
end

n_keymap("<S-l>", "<cmd>Lazy<cr>", "Open Lazy")
n_keymap("<leader>so", "<cmd>so %<cr>", "Reload the config")

-- Oil Keybinding: {{{
--
n_keymap("-", "<CMD>Oil<CR>", "Open parent directory")
-- keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--
-- }}}

-- TODO: Change for snacks Picker
-- Telescope Keybinding: {{{
--
local telescope = require("telescope.builtin")

n_keymap("<leader>ff", function()
	telescope.find_files(require("telescope.themes").get_ivy({
		sort_mru = true,
		sort_lastused = false,
		layout_config = {
			preview_width = 0.45,
		},
	}))
end, "Telescope find files")
n_keymap("<leader>fg", telescope.live_grep, "Telescope live grep")
n_keymap("<leader>fh", telescope.help_tags, "Telescope help tags")
n_keymap("<S-h>", function()
	require("telescope.builtin").buffers(require("telescope.themes").get_ivy({
		sort_mru = true,
		sort_lastused = false,
		initial_mode = "normal",
		layout_config = {
			preview_width = 0.45,
		},
	}))
end, "Open a view of all buffers")
n_keymap("<leader>ft", "<cmd>TodoTelescope<cr>", "Fetch Todos")
--
-- }}}

-- Snacks Keybinding: {{{
--
n_keymap("<leader>sbd", function()
	Snacks.bufdelete("%")
end, "Delete the current buffer")
n_keymap("<leader>sbl", "<cmd>lua Snacks.git.blame_line()<cr>", "Show git log for the current line")
n_keymap("<leader>snh", "<cmd>lua Snacks.notifier.show_history()<cr>", "Shows notifications history")
n_keymap("szz", function()
	Snacks.zen.zen()
end, "Open a zen float windows")
n_keymap("szf", function()
	Snacks.zen.zoom()
end, "Open a zen zoom windows")
n_keymap("<leader>.", function()
	Snacks.scratch()
end, "Toggle Scratch buffer")
n_keymap("<leader>S", function()
	Snacks.scratch.select()
end, "Select Scratch buffer")
n_keymap("<leader>st", function()
	Snacks.terminal.toggle()
end, "Toggle terminal")
--
-- }}}

-- Neogit Keybinding: {{{
--
local neogit = require("neogit")
n_keymap("<leader>ng", neogit.open, "Open Neogit")
n_keymap("<leader>nl", "<CMD>Neogit log<CR>", "Open Logs")
n_keymap("<leader>nb", "<CMD>Neogit branch<CR>", "Open branch")
--
-- }}}

-- Utility Keybinding: {{{
--
n_keymap("<leader>q", "<cmd>q<cr>", "Quit neovim")
n_keymap("<leader>w", "<cmd>w<cr>", "Save current buffer")
local ufo = require("ufo")
n_keymap("zR", ufo.openAllFolds, "Open All folds")
n_keymap("zM", ufo.closeAllFolds, "Closes All folds")
n_keymap("zr", ufo.openFoldsExceptKinds, "Open All folds except kinds")
n_keymap("zm", ufo.closeFoldsWith, "Closes All folds")
n_keymap("ñ", function()
	ufo.peekFoldedLinesUnderCursor()
end)
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to the beginning line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Go to the end of the line" })

-- Function to navigate windows inside neovim
local function navigate_window(direction)
	return function()
		if vim.fn.mode() == "1" then
			vim.api.nvim_feedkeys(
				vim.api.nvim_replace_termcodes("<Esc><C-w>" .. direction, true, false, true),
				"n",
				true
			)
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
n_keymap("<leader>h", ":nohlsearch<CR>", "Stop searching")

-- Start godot server
n_keymap("<leader>gs", function()
	vim.fn.serverstart("127.0.0.1:6004")
end, "Start Godot server")
n_keymap("<leader>gt", function()
	vim.fn.serverstop("127.0.0.1:6004")
end, "Stop Godot server")
--
-- }}}

-- Insert Keybinding: {{{
--
i_keymap("jj", "<Esc>", "Exit Insert mode")
--- }}}

-- Persistence Keybinding: {{{
-- load the session for the current directory
vim.keymap.set("n", "<leader>ps", function()
	require("persistence").load()
end, { desc = "Load the session for the current directory", silent = true })

-- select a session to load
vim.keymap.set("n", "<leader>pS", function()
	require("persistence").select()
end, { desc = "Select a session to load", silent = true })

-- load the last session
vim.keymap.set("n", "<leader>pl", function()
	require("persistence").load({ last = true })
end, { desc = "Load the last session", silent = true })

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>pd", function()
	require("persistence").stop()
end, { desc = "Stop Persistence", silent = true })
-- }}}
-- }}}
