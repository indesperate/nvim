-- lsp config
require("neoconf").setup({})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason").setup()
require("mason-lspconfig").setup({
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
})
