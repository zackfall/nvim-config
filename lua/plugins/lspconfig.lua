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
		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					-- on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
		lspconfig["pylsp"].setup({
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							ignore = { "W319" },
							maxLineLength = 100,
						},
					},
				},
			},
		})

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
