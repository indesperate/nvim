return {

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		keys = {
			{
				"<leader>ef",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
			{
				"<leader>eg",
				function()
					require("neo-tree.command").execute({ source = "git_status", toggle = true })
				end,
				desc = "Git explorer",
			},
			{
				"<leader>eb",
				function()
					require("neo-tree.command").execute({ source = "buffers", toggle = true })
				end,
				desc = "Buffer explorer",
			},
			{
				"<leader>ed",
				function()
					require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
				end,
				desc = "Symbols explorer",
			},
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		opts = {
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			filesystem = {
				group_empty_dirs = true,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				width = 30,
			},
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("fzf")
			local builtin = require("telescope.builtin")
			local map = vim.keymap.set
			map("n", "<leader>ff", builtin.find_files, { desc = "Find files", silent = true })
			map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep", silent = true })
			map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers", silent = true })
			map("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags", silent = true })
			map("n", "<leader>fc", builtin.command_history, { desc = "Find command history", silent = true })
			map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Find in cbuffer", silent = true })
			map("n", "gr", builtin.lsp_references, { desc = "lsp refer", silent = true })
			map("n", "gd", builtin.lsp_definitions, { desc = "lsp def", silent = true })
			map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "lsp type def", silent = true })
			map("n", "gi", builtin.lsp_implementations, { desc = "lsp impl", silent = true })
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = { enabled = false },
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, { desc = "git next hunk", silent = true })

				map("n", "[h", gs.prev_hunk, { desc = "git prev hunk", silent = true })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, { desc = "git stage hunk", silent = true })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "git reset hunk", silent = true })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "git stage hunk", silent = true })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "git reset hunk", silent = true })
				map("n", "<leader>hS", gs.stage_buffer, { desc = "git stage buffer", silent = true })
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "git unstage hunk", silent = true })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "git reset buffer", silent = true })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "git previre hunk", silent = true })
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "git blame line", silent = true })
				map("n", "<leader>hd", gs.diffthis, { desc = "git diff this", silent = true })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "git diff file", silent = true })
				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "hunk block", silent = true })
			end,
		},
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = "Toggleterm",
		opts = {
			open_mapping = "<leader>p",
			direction = "float",
			shell = vim.g.toggleshell,
		},
		keys = {
			{
				"<leader>p",
				function()
					require("toggleterm").Toggleterm()
				end,
				desc = "Open float terminal",
			},
		},
	},
}
