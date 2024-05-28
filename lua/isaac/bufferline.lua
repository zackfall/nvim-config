require("bufferline").setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get()
}

local mycolors = vim.api.nvim_create_augroup("MyColors", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "BufferLineFill", { guibg = nil })
  end,
  group = mycolors
})

-- vim.cmd([[
-- augroup MyColors
-- autocmd!
-- autocmd ColorScheme * highlight BufferLineFill guibg=NONE
-- augroup END
-- ]])
