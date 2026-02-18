return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    -- local on_attach = function(client)
    --   require('completion').on_attach(client)
    -- end

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion = { callSnippet = "Replace" },
        },
      }
    })
    vim.lsp.enable("lua_ls")

    -- Detectar automáticamente el Python del proyecto
    local function get_python_path()
      local cwd = vim.fn.getcwd()

      -- Prioridad: .venv
      if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      end

      -- Detectar pyenv local
      local handle = io.popen("pyenv which python 2>/dev/null")
      if handle then
        local result = handle:read("*a")
        handle:close()
        if result and result ~= "" then
          return result:gsub("%s+$", "")
        end
      end

      -- Fallback
      return "/usr/bin/python3"
    end

    vim.lsp.config("pylsp", {
      capabilities = capabilities,
      cmd = { get_python_path(), "-m", "pylsp" },
      settings = {
        pylsp = {
          plugins = {
            ruff = { enabled = true },
            pylsp_mypy = {
              enabled = true,
              live_mode = true, -- análisis en tiempo real
              dmypy = false,    -- puedes activar si quieres daemon más rápido
              strict = true,    -- ponlo en true si quieres modo estricto
              overrides = {
                "--python-executable", get_python_path(),
              },
            },
            pycodestyle = {
              ignore = { "W319" },
              maxLineLength = 100,
            },
          },
        },
      },
    })
    vim.lsp.enable("pylsp")

    vim.lsp.config("graphql", {
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
    })
    vim.lsp.enable("graphql")

    require("ufo").setup()

    local keymap = vim.keymap

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚",
          [vim.diagnostic.severity.WARN] = "󰀪",
          [vim.diagnostic.severity.HINT] = "󰌶",
          [vim.diagnostic.severity.INFO] = "",
        },
        linehl = {},
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.HINT] = "HintMsg",
          [vim.diagnostic.severity.INFO] = "InfoMsg",
        },
      },
    })

    -- Keymaps CMD
    --
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "{d", function()
          vim.diagnostic.jump({ count = 1, float = true })
        end, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "}d", function()
          vim.diagnostic.jump({ count = -1, float = true })
        end, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Stop LSP"
        keymap.set("n", "<leader>llt", ":LspStop<CR>", opts) -- mapping to restart lsp if necessary

        opts.desc = "Start LSP"
        keymap.set("n", "<leader>lls", ":LspStart<CR>", opts) -- mapping to restart lsp if necessary

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>llr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

        opts.desc = "Lsp Info"
        keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
      end,
    })
  end,
}
