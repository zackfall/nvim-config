local M = {}

function M.shot_file_to_clipboard()
	require("code-shot").shot(function(context)
		vim.system(
			{
				"silicon",
				"--to-clipboard",
				context.file_path,
			},
			nil,
			function(result)
				if result.code == 0 then
					vim.notify("Shot code successfully", vim.log.levels.INFO)
				else
					vim.notify("Shot code failed", vim.log.levels.ERROR)
				end
			end
		)
	end)
end

function M.shot_file_to_file()
	require("code-shot").shot(function(context)
		vim.system(
			{
				"silicon",
				"-o",
				string.format("%s.png", os.date("%Y-%m-%d_%H:%M:%S")),
				context.file_path,
			},
			nil,
			function(result)
				if result.code == 0 then
					vim.notify("Shot code successfully", vim.log.levels.INFO)
				else
					vim.notify("Shot code failed", vim.log.levels.ERROR)
				end
			end
		)
	end)
end

function M.shot_selection_to_clipboard()
	require("code-shot").shot(function(context)
		vim.system({
			"silicon",
			"--to-clipboard",
			"--language",
			context.file_type,
		}, { stdin = context.selection }, function(result)
			if result.code == 0 then
				vim.notify("Shot code successfully", vim.log.levels.INFO)
			else
				vim.notify("Shot code failed", vim.log.levels.ERROR)
			end
		end)
	end)
end

M.shot_selection_to_file = function()
	require("code-shot").shot(function(context)
		require("omega").to_normal_mode()

		vim.system({
			"silicon",
			"-o",
			string.format("%s.png", os.date("%Y-%m-%d_%H:%M:%S")),
			"--language",
			context.file_type,
		}, {
			stdin = context.selection,
		}, function(result)
			if result.code == 0 then
				vim.notify("Shot code successfully", vim.log.levels.INFO)
			else
				vim.notify("Shot code failed", vim.log.levels.ERROR)
			end
		end)
	end)
end

return M
