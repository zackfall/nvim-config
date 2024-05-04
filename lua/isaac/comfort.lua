require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    html = { "prettier" },
    css = { "prettier" },
    rust = { "rustfmt" }
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true
  }
})
