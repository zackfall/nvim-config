return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "rust", "c", "lua", "javascript", "vim", "vimdoc", "query",
        "markdown", "markdown_inline", "python", "typescript", "bash",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ignore_install = {},
      modules = {}
    })
  end,
}
