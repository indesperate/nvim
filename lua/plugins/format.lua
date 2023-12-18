return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			sh = { "shfmt" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
		notify_on_error = true,
	},
	keys = {
		{
			"<leader>=",
			function()
				require("conform").format({ lsp_fallback = "always" })
			end,
			desc = "format",
		},
	},
}
