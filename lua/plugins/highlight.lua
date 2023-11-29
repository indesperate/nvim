-- nvim-treesitter config
require("nvim-treesitter")
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"diff",
		"git_config",
		"gitcommit",
		"gitignore",
		"json",
		"json5",
		"jsonc",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"rust",
		"ssh_config",
		"toml",
		"vim",
		"vimdoc",
		"yaml",
	},
	auto_install = true,
	highlight = {
		enable = true,
		-- additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
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
require("nvim-treesitter.install").prefer_git = true
