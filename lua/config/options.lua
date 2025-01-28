local o = vim.o
local api = vim.api

o.number = true
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

api.nvim_create_autocmd({"BufReadPost", "FileReadPost"}, {
  pattern = "*",
  command = "normal! zR"
})

vim.cmd([[au BufEnter * silent! setlocal foldlevel=99]])
