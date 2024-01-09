return {
	{
		"stevearc/overseer.nvim",
		cmd = { "OverseerRun", "OverseerToggle", "OverseerBuild" },
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {},
		keys = {
			{
				"<leader>t",
				function()
					require("overseer").toggle()
				end,
				{ desc = "Toggle task overview" },
			},
			{
				"<leader>b",
				"<CMD>OverseerRun<CR>",
				{ desc = "Build tasks" },
			},
		},
	},
}
