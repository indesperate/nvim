return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		integrations = {
			native_lsp = {
				enabled = true,
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
			},
			blink_cmp = true,
			dropbar = {
				enabled = true,
				color_mode = true,
			},
			fzf = true,
			mason = true,
			markdown = true,
			nvim_surround = true,
			treesitter = true,
			treesitter_context = true,
			snacks = true,
			which_key = true,
		},
	},
}
