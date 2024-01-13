local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		keys = {
			{ "gn", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection" },
		},
		opts = {
			auto_install = false,
			highlight = {
				enable = false,
			},
			indent = {
				enable = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gn",
					node_incremental = "gn",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["a="] = { query = "@assignment.outer", desc = "Select assignment outer" },
						["i="] = { query = "@assignment.inner", desc = "Select assignment inner" },
						["l="] = { query = "@assignment.lhs", desc = "Select assignment left hand side" },
						["r="] = { query = "@assignment.rhs", desc = "Select assignment right hand side" },

						["aa"] = { query = "@parameter.outer", desc = "Select parameter outer" },
						["ia"] = { query = "@parameter.inner", desc = "Select parameter inner" },

						["ai"] = { query = "@conditional.outer", desc = "Select conditional outer" },
						["ii"] = { query = "@conditional.inner", desc = "Select conditional inner" },

						["al"] = { query = "@loop.outer", desc = "Select loop outer" },
						["il"] = { query = "@loop.inner", desc = "Select loop inner" },

						["af"] = { query = "@call.outer", desc = "Select function call outer" },
						["if"] = { query = "@call.inner", desc = "Select function call inner" },

						["am"] = { query = "@function.outer", desc = "Select method impl outer" },
						["im"] = { query = "@function.inner", desc = "Select method impl inner" },

						["ac"] = { query = "@class.outer", desc = "Select class outer" },
						["ic"] = { query = "@class.inner", desc = "Select class inner" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sa"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
						["<leader>sm"] = { query = "@function.outer", desc = "Swap with next function" },
					},
					swap_previous = {
						["<leader>Sm"] = { query = "@function.outer", desc = "Swap with previous function" },
						["<leader>Sa"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]="] = { query = "@assignment.outer", desc = "Next assignment start" },
						["]f"] = { query = "@call.outer", desc = "Next function call start" },
						["]m"] = { query = "@function.outer", desc = "Next method start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]a"] = { query = "@parameter.outer", desc = "Next parameter start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
					},
					goto_next_end = {
						["]+"] = { query = "@assignment.outer", desc = "Next assignment end" },
						["]F"] = { query = "@call.outer", desc = "Next function call end" },
						["]M"] = { query = "@function.outer", desc = "Next method end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]A"] = { query = "@parameter.outer", desc = "Next parameter end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
					},
					goto_previous_start = {
						["[="] = { query = "@assignment.outer", desc = "Previous assignment start" },
						["[f"] = { query = "@call.outer", desc = "Previous function call start" },
						["[m"] = { query = "@function.outer", desc = "Previous method start" },
						["[c"] = { query = "@class.outer", desc = "Previous class start" },
						["[a"] = { query = "@parameter.outer", desc = "Previous parameter start" },
						["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
						["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
					},
					goto_previous_end = {
						["[+"] = { query = "@assignment.outer", desc = "Previous assignment end" },
						["[F"] = { query = "@call.outer", desc = "Previous function call end" },
						["[M"] = { query = "@function.outer", desc = "Previous method end" },
						["[C"] = { query = "@class.outer", desc = "Previous class end" },
						["[A"] = { query = "@parameter.outer", desc = "Previous parameter end" },
						["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
						["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"kylechui/nvim-surround",
		lazy = false,
		config = function()
			require("nvim-surround").setup()
		end,
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
		},
	},
})
