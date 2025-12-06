return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		-- This is the same as the colors.lua snippet
		setup = function()
			local colors = require("tokyonight.colors")
			for name, hex in pairs(colors) do
				vim.api.nvim_set_hl(0, name, { fg = hex })
			end
		end,
	},
}
