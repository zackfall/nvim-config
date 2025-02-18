return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"biome",
				"tailwindcss",
				"lua_ls",
				"graphql",
				"prismals",
				"pyright",
			},
		})

		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" },
		})
	end,
}
