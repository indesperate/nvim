return {
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	-- show key help
	{
		"folke/which-key.nvim",
		lazy = true,
		cmd = "WhichKey",
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = false,
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		lazy = false,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		opts = {},
	},
}
