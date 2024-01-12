if vim.g.vscode then
	require("vscode-nvim")
else
	require("basic")
	require("lazy-boot")
	vim.cmd.colorscheme("catppuccin")
	require("map")
end
