local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 2,
  signcolumn = "yes",
  wrap = false,
  linebreak = true,
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",
  whichwrap = "bs<>[]hl",
}

local opt = vim.opt

for k, v in pairs(options) do
  opt[k] = v
end

opt.shortmess:append "c"
opt.iskeyword:append "-"
opt.formatoptions:remove({ "c", "r", "o" })
opt.runtimepath:remove("/usr/share/vim/vimfiles")

-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
--   callback = function()
--     require('lint').try_lint()
--   end
-- })

require("nvim-ts-autotag").setup({
  enable_rename = true,
  enable_close = true,
  enable_close_on_slash = true
})

require('colorizer').setup()
