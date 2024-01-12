local opt = vim.opt
local g = vim.g
-- leader key
g.mapleader = " "
opt.virtualedit = "block"

-- set vim grep
if vim.fn.executable("rg") then
	opt.grepformat = "%f:%l:%c:%m"
	opt.grepprg = "rg --vimgrep --smart-case"
end
