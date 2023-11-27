require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		sh = { "sh-fmt" },
		toml = { "taplo" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	notify_on_error = true,
})
