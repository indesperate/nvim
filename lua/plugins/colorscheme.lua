return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		integrations = {
			telescope = true,
			semantic_tokens = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			noice = true,
			dashboard = true,
			which_key = true,
			cmp = true,
			mason = true,
			neotree = true,
			treesitter = true,
			flash = true,
			treesitter_context = true,
			notify = true,
			lsp_trouble = true,
			gitsigns = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
