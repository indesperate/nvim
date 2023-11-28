require("gitsigns").setup({
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
})
