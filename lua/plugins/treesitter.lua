return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treeitter** module to be loaded in time.
			-- Luckily, the only thins that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = {
					enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
					max_lines = vim.o.scrolloff, -- How many lines the window should span. Values <= 0 mean no limit.
					min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
					line_numbers = true,
					multiline_threshold = 20, -- Maximum number of lines to show for a single context
					trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
					mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
					-- Separator between context and content. Should be a single character string, like '-'.
					-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
					separator = nil,
					zindex = 20, -- The Z-index of the context window
					on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
				},
			},
		},
		keys = {
			{ "gn", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection" },
		},
		opts = {
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

						["is"] = { query = "@statement.outer", desc = "Select statement outer" },
						["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sa"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
						["<leader>sm"] = { query = "@function.outer", desc = "Swap with next function" },
						["<leader>ss"] = { query = "@statement.outer", desc = "Swap with next statement" },
					},
					swap_previous = {
						["<leader>sA"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
						["<leader>sM"] = { query = "@function.outer", desc = "Swap with previous function" },
						["<leader>sS"] = { query = "@statement.outer", desc = "Swap with previous statement" },
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
						["]s"] = { query = "@statement.outer", desc = "Next statement start" },
					},
					goto_next_end = {
						["]+"] = { query = "@assignment.outer", desc = "Next assignment end" },
						["]F"] = { query = "@call.outer", desc = "Next function call end" },
						["]M"] = { query = "@function.outer", desc = "Next method end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]A"] = { query = "@parameter.outer", desc = "Next parameter end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]S"] = { query = "@statement.outer", desc = "Next statement end" },
					},
					goto_previous_start = {
						["[="] = { query = "@assignment.outer", desc = "Previous assignment start" },
						["[f"] = { query = "@call.outer", desc = "Previous function call start" },
						["[m"] = { query = "@function.outer", desc = "Previous method start" },
						["[c"] = { query = "@class.outer", desc = "Previous class start" },
						["[a"] = { query = "@parameter.outer", desc = "Previous parameter start" },
						["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
						["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
						["[s"] = { query = "@statement.outer", desc = "Previous statement start" },
					},
					goto_previous_end = {
						["[+"] = { query = "@assignment.outer", desc = "Previous assignment end" },
						["[F"] = { query = "@call.outer", desc = "Previous function call end" },
						["[M"] = { query = "@function.outer", desc = "Previous method end" },
						["[C"] = { query = "@class.outer", desc = "Previous class end" },
						["[A"] = { query = "@parameter.outer", desc = "Previous parameter end" },
						["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
						["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
						["[S"] = { query = "@statement.outer", desc = "Previous statement end" },
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
