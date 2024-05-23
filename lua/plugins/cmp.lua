local cmp_max_len = 20
local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}
return {
	-- snip
	{
		"garymjr/nvim-snippets",
		opts = {
			friendly_snippets = true,
			global_snippets = { "all", "global" },
		},
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	-- auto complete
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"garymjr/nvim-snippets",
		},
		config = function()
			-- complete
			local cmp = require("cmp")
			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "snippets" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
					{ name = "orgmode" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif vim.snippet.active({ direction = 1 }) then
							vim.schedule(function()
								vim.snippet.jump(1)
							end)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif vim.snippet.active({ direction = -1 }) then
							vim.schedule(function()
								vim.snippet.jump(-1)
							end)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(_, vim_item)
						vim_item.kind = kind_icons[vim_item.kind] or ""
						if string.len(vim_item.abbr) > cmp_max_len then
							local label = vim_item.abbr
							local truncated_label = vim.fn.strcharpart(label, 0, cmp_max_len)
							if truncated_label ~= label then
								vim_item.abbr = truncated_label .. "..."
							end
						end
						vim_item.menu = ""
						return vim_item
					end,
				},
			})

			-- use when in search mode
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- use when in command mode
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		cmd = "Copilot",
		opts = {
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<c-j>",
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
			filetypes = {
				lua = true,
				c = true,
				cpp = true,
				markdown = true,
				sh = true,
				rust = true,
				python = true,
				makefile = true,
				cmake = true,
				["*"] = false,
			},
		},
	},
}
