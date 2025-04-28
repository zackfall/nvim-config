-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Clear search and stop snippet from insert mode
map("i", "jj", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

map({ "n", "s" }, "<Esc>", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
end, { expr = true, desc = "Clear hlsearch" })

map("n", "<C-a>", function()
  vim.cmd("ggVG")
end, { expr = true, desc = "Select all" })

map("v", "J", ":m '>+1<CR>gv=gv", { expr = true, desc = "Move line down in visual mode" })
map("v", "K", ":m '<-2<CR>gv=gv", { expr = true, desc = "Move line up in visual mode" })

-- Start godot server
-- map("<leader>gs", function()
--   vim.fn.serverstart("127.0.0.1:6004")
-- end, { desc = "start godot server" })
-- map("<leader>gt", function()
--   vim.fn.serverstop("127.0.0.1:6004")
-- end, { desc = "Stop Godot server" })
