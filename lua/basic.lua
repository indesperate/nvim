local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
-- leader key
g.mapleader = " "

-- show number
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- tab config
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- search config
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

-- true color
opt.termguicolors = true

opt.formatoptions = "jcroqlnt" -- tcqj
opt.showmode = false           -- Dont show mode since we have a statusline
opt.timeout = true
opt.timeoutlen = 300

-- restore cursor when leave
autocmd({ "VimLeave" }, {
	callback = function()
		opt.guicursor = "a:ver25-blinkon1"
	end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- close some filetypes with <q>
autocmd("FileType", {
	pattern = {
		"help",
		"man",
		"notify",
		"query",
		"spectre_panel",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
