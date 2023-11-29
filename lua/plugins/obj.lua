require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
			},
			selection_modes = {
				["@function.outer"] = "V",
				["@class.outer"] = "V",
				["@conditional.outer"] = "V",
				["@loop.outer"] = "V",
			},
		},
	},
})
