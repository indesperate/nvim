local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
-- leader key
g.mapleader = " "

-- use nvimtree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- show number
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- tab config
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- search config
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

-- true color
opt.termguicolors = true

-- restore cursor when leave
autocmd({ "VimLeave" }, {
	callback = function()
		opt.guicursor = "a:ver25-blinkon1"
	end,
})
