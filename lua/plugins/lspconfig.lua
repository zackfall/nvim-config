return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- IMPORTANTE: Ya no necesitamos llamar a lspconfig directamente para el setup
    -- pero lo requerimos para que cargue las configs por defecto
    require("lspconfig")
    require("mason-lspconfig")
    local ufo = require("ufo")

    -- Capacidades para autocompletado (blink.cmp) y folding (ufo)
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    -------------------------------------------------------------------------
    -- 2. Configuración de Servidores (NUEVA API vim.lsp.config)
    -------------------------------------------------------------------------

    -- LUA
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion = { callSnippet = "Replace" },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- PYTHON (PYLSP) - Aquí estaba el conflicto
    vim.lsp.config("pylsp", {
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            -- Desactivamos lo que se solapa con Ruff
            pycodestyle = { enabled = false },
            mccabe = { enabled = false },
            pyflakes = { enabled = false },

            -- Linter rápido
            ruff = { enabled = true },

            -- MYPY con la inyección del path
            pylsp_mypy = {
              enabled = false
            },
          },
        },
      },
    })
    vim.lsp.enable("pylsp")

    -- GRAPHQL
    vim.lsp.config("graphql", {
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
    })
    vim.lsp.enable("graphql")

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      }
    })
    vim.lsp.enable("ts_ls")

    -- (Opcional pero recomendado) Soporte para Tailwind CSS, casi un estándar en Next.js
    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
      filetypes = { "html", "css", "javascriptreact", "typescriptreact", "mdx" },
    })
    vim.lsp.enable("tailwindcss")

    -- (Opcional pero recomendado) Soporte para ESLint
    vim.lsp.config("eslint", {
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    })
    vim.lsp.enable("eslint")

    -------------------------------------------------------------------------
    -- 3. Configuración General (UI, Keymaps, UFO)
    -------------------------------------------------------------------------
    ufo.setup()

    -- Signos de diagnóstico bonitos
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚",
          [vim.diagnostic.severity.WARN] = "󰀪",
          [vim.diagnostic.severity.HINT] = "󰌶",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    })

    -- Autocomandos y Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        -- Keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "{d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "}d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

        opts.desc = "Show documentation"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>llr", ":LspRestart<CR>", opts)

        opts.desc = "Lsp Info"
        keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
      end,
    })
  end,
}
