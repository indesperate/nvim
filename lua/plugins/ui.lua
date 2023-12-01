---@diagnostic disable: missing-fields
-- theme
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		telescope = {
			enabled = true,
		},
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
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
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
	},
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
			hints = { "underline" },
			warnings = { "underline" },
			information = { "underline" },
		},
		inlay_hints = {
			background = true,
		},
	},
})
vim.cmd.colorscheme("catppuccin")

-- line down
require("lualine").setup({
	options = {
		globalstatus = true,
		theme = "catppuccin",
	},
})

-- line up
require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neo-tree",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})

-- file explorer
require("neo-tree").setup({
	open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
	close_if_last_window = true,
	filesystem = {
		group_empty_dirs = true,
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
	},
	window = {
		width = 30,
	},
	sources = { "filesystem", "buffers", "git_status", "document_symbols" },
})

require("colorizer").setup()

require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	routes = {
		{
			view = "mini",
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
		},
		{
			view = "popup",
			filter = {
				any = {
					{ cmdline = "^:!" },
					{ cmdline = "^:reg" },
					{ cmdline = "^:dis" },
					{ cmdline = "^:ls" },
					{ cmdline = "^:marks" },
					{ cmdline = "^:hi" },
				},
			},
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})

require("which-key").setup()

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = { enabled = false },
	exclude = {
		filetypes = {
			"help",
			"dashboard",
			"neo-tree",
			"Trouble",
			"trouble",
			"lazy",
			"mason",
			"notify",
		},
	},
})

require("notify").setup({
	background_colour = "#000000",
})
