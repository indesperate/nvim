local capabilities = require("cmp_nvim_lsp").default_capabilities()
return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufRead", "BufNewFile" },
		opts = {
			handlers = {
				function(server_name) -- default handler
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
			},
		},
		config = function(_, opts)
			require("neoconf").setup()
			require("mason-lspconfig").setup(opts)
		end,
		dependencies = {
			"folke/neoconf.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
