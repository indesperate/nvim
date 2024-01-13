return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = function()
			require("telescope").load_extension("fzf")
		end,
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").command_history()
				end,
				desc = "Seacch command history",
			},
			{
				"<leader>fs",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Seacch buffer symbols",
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = { enabled = false },
				search = { enabled = false },
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
		event = { "BufReadPre", "BufNewFile" },
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
				map("n", "]g", gs.next_hunk, { desc = "Next git change", silent = true })

				map("n", "[g", gs.prev_hunk, { desc = "Previoud git change", silent = true })

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
			direction = "float",
			shell = vim.g.toggleshell,
		},
		keys = {
			{
				"<leader>p",
				"<cmd>ToggleTerm<cr>",
				desc = "Open float terminal",
			},
		},
	},
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
	},
}
