return {
	"stevearc/conform.nvim",
	---@module 'conform'
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd", "rustywind" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd", "rustywind" },
			css = { "prettierd" },
			scss = { "prettierd" },
			html = { "prettierd", "rustywind" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			graphql = { "prettierd" },
			astro = { "prettierd", "rustywind" },
			bash = { "beautysh" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			gdscript = { "gdformat" },
			go = { "gofumpt", "goimports" },
			java = { "google-java-format" },
			sql = { "sqlfluff" },
			toml = { "taplo" },
			plaintex = { "tex-fmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
