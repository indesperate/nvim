return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "VimEnter" },
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
						["af"] = { query = "@function.outer", desc = "Select function impl outer" },
						["if"] = { query = "@function.inner", desc = "Select function impl inner" },

						["al"] = { query = "@loop.outer", desc = "Select loop outer" },
						["il"] = { query = "@loop.inner", desc = "Select loop inner" },

						["am"] = { query = "@call.outer", desc = "Select function call outer" },
						["im"] = { query = "@call.inner", desc = "Select function call inner" },

						["ak"] = { query = "@class.outer", desc = "Select class outer" },
						["ik"] = { query = "@class.inner", desc = "Select class inner" },

						["ac"] = { query = "@comment.outer", desc = "Select comment outer" },
						["ic"] = { query = "@comment.inner", desc = "Select comment inner" },

						["ap"] = { query = "@parameter.outer", desc = "Select parameter outer" },
						["ip"] = { query = "@parameter.inner", desc = "Select parameter inner" },

						["ai"] = { query = "@conditional.outer", desc = "Select conditional outer" },
						["ii"] = { query = "@conditional.inner", desc = "Select conditional inner" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sp"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
						["<leader>sf"] = { query = "@function.outer", desc = "Swap with next function" },
					},
					swap_previous = {
						["<leader>sP"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
						["<leader>sF"] = { query = "@function.outer", desc = "Swap with previous function" },
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = { query = "@call.outer", desc = "Next function call start" },
						["]f"] = { query = "@function.outer", desc = "Next method start" },
						["]k"] = { query = "@class.outer", desc = "Next class start" },
						["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
					},
					goto_next_end = {
						["]M"] = { query = "@call.outer", desc = "Next function call end" },
						["]F"] = { query = "@function.outer", desc = "Next method end" },
						["]K"] = { query = "@class.outer", desc = "Next class end" },
						["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
					},
					goto_previous_start = {
						["[m"] = { query = "@call.outer", desc = "Previous function call start" },
						["[f"] = { query = "@function.outer", desc = "Previous method start" },
						["[k"] = { query = "@class.outer", desc = "Previous class start" },
						["[p"] = { query = "@parameter.outer", desc = "Previous parameter start" },
						["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
						["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
					},
					goto_previous_end = {
						["[M"] = { query = "@call.outer", desc = "Previous function call end" },
						["[F"] = { query = "@function.outer", desc = "Previous method end" },
						["[K"] = { query = "@class.outer", desc = "Previous class end" },
						["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
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
}
