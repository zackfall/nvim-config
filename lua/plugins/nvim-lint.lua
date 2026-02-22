return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- 1. Asignación exclusiva para linters que no son LSP
    lint.linters_by_ft = {
      python = { "mypy" },
      gdscript = { "gdlint" },
    }

    -- 2. Configuración específica para Python (Mypy + Pyenv)
    lint.linters.mypy.cmd = function()
      local handle = io.popen("pyenv which mypy 2>/dev/null")
      if handle then
        local result = handle:read("*a")
        handle:close()
        if result and result ~= "" then
          return result:gsub("%s+$", "")
        end
      end
      return "mypy"
    end

    -- Argumentos estándar para Django
    lint.linters.mypy.args = {
      "--show-column-numbers",
      "--hide-error-codes",
      "--no-color-output",
      "--no-error-summary",
      "--no-pretty",
    }

    -- 3. Auto-comando para ejecutar el linter automáticamente
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        pcall(lint.try_lint)
      end,
    })
  end,
}
