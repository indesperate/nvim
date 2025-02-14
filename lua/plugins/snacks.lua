return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {},
		input = {},
		notifier = {},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
