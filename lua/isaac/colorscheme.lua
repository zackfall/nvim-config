require("catppuccin").setup({
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    notify = true,
    alpha = true
  }
})

vim.cmd.colorscheme "catppuccin-mocha"
