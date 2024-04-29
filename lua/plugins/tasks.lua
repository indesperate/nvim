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
				"<leader>tt",
				function()
					require("overseer").toggle()
				end,
				{ desc = "Toggle task overview" },
			},
			{
				"<leader>tb",
				"<CMD>OverseerRun<CR>",
				{ desc = "Build tasks" },
			},
		},
	},
	{
		"michaelb/sniprun",
    enabled = function ()
      return vim.g.os ~= "Windows"
    end,
		cmd = { "SnipRun" },
		build = "sh install.sh",
		opts = {},
	},
}
