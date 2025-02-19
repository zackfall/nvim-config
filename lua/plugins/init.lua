return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "github/copilot.vim" },
	{ "xiyaowong/transparent.nvim" },
	{ "wakatime/vim-wakatime" },
	{ "brenoprata10/nvim-highlight-colors", opts = {} },
	{
		"vhyrro/luarocks.nvim",
		priority = 1001,
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"OXY2DEV/helpview.nvim",
		lazy = false, -- Recommended

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup({})
		end,
	},
}
