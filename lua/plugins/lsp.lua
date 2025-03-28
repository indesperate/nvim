local capabilities = require("blink.cmp").get_lsp_capabilities()
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
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			handlers = {
				function(server_name) -- default handler
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
