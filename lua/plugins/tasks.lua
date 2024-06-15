return {
	{
		"michaelb/sniprun",
		enabled = function()
			return vim.g.os ~= "Windows"
		end,
		cmd = { "SnipRun" },
		build = "sh install.sh",
		opts = {},
	},
}
