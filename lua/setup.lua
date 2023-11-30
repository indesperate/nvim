local plugins = {
	-- theme and ui
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	-- lsp and complete
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"onsails/lspkind-nvim",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- format
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		lazy = true,
		cmd = "ConformInfo",
	},
	-- telescope
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- highlight
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	-- jump
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
	"christoomey/vim-tmux-navigator",
	-- neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
	},
	-- float ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"stevearc/dressing.nvim",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	-- begin
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- utils
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"nvim-pack/nvim-spectre",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	"norcalli/nvim-colorizer.lua",
	"echasnovski/mini.pairs",
	"echasnovski/mini.comment",
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{ "folke/neodev.nvim", opts = {} },
	{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
}

local opts = {}

return { plugins, opts }
