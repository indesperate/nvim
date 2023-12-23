return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = true,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		integrations = {
			telescope = {
				enabled = true,
				style = "nvchad",
			},
			semantic_tokens = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
			inlay_hints = {
				background = true,
			},
			dropbar = {
				enabled = true,
				color_mode = true,
			},
			markdown = true,
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
}
