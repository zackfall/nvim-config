return {
	"mfussenegger/nvim-dap",
	dependencies = { "theHamsta/nvim-dap-virtual-text" },
	config = function()
		local dap = require("dap")
		local dap_virtual_text = require("nvim-dap-virtual-text")
		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb",
		}
		dap.adapters.godot = {
			type = "server",
			host = "127.0.0.1",
			port = 6007,
		}
		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.gdscript = {
			{
				type = "godot",
				request = "launch",
				name = "Launch scene",
				project = "${workspaceFolder}",
				launch_scene = true,
			},
		}

		---@diagnostic disable-next-line: missing-fields
		dap_virtual_text.setup({
			enabled = true,
			commented = true,
		})
	end,
}
