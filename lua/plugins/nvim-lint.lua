return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "mypy" },
    }

    -- Función para detectar el mypy de Pyenv
    lint.linters.mypy.cmd = function()
      -- Preguntamos a pyenv cuál es el ejecutable de mypy para el directorio actual
      local handle = io.popen("pyenv which mypy 2>/dev/null")
      if handle then
        local result = handle:read("*a")
        handle:close()
        if result and result ~= "" then
          -- Limpiamos el salto de línea final y devolvemos la ruta absoluta
          return result:gsub("%s+$", "")
        end
      end

      -- Fallback: si falla pyenv, intentamos usar el del sistema
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

    -- Auto-comando para ejecutar el linter
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
