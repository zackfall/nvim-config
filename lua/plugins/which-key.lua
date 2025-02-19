return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>x", group = "Trouble" },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>n", group = "Neogit" },
			{ "<leader>s", group = "Snacks" },
			{ "<leader>g", group = "Godot" },
			{ "<leader>t", group = "Neotest" },
			{ "<leader>p", group = "Persistence" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
