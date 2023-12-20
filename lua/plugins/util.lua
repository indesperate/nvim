return {
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.comment",
		event = "BufRead",
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "BufRead",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
}
