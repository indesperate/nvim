return {
	-- upper bufferline
	{
		"akinsho/bufferline.nvim",
		opts = {
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				custom = {
					all = {
						fill = { bg = "#000000" },
						background = {
							bg = "#000000",
						},
						separator = {
							bg = "#000000",
						},
					},
				},
			}),
			options = {
				right_mouse_command = "BufferLineTogglePin",
				diagnostics = "nvim_lsp",
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	-- under status line
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "catppuccin",
				disabled_filetypes = { statusline = { "dashboard" } },
			},
			extensions = { "neo-tree" },
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = {
					{
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.mode.has()
						end,
					},
					"%S",
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "branch" },
			},
		},
	},
	-- show key help
	{
		"folke/which-key.nvim",
		lazy = true,
		cmd = "WhichKey",
		opts = {},
	},
	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"Bekaboo/dropbar.nvim",
		event = { "BufReadPre", "BufNewFile" },
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
}
