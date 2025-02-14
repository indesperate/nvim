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
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
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
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { "%S" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "branch" },
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- icons
	{
		"Bekaboo/dropbar.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
}
