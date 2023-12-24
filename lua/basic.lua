local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
-- leader key
g.mapleader = " "
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
g.tmux_navigator_no_mappings = 1

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
opt.showmode = false -- Dont show mode since we have a statusline
opt.timeout = true
opt.timeoutlen = 300

-- list chars
opt.list = true
opt.listchars = "tab:  ,trail:·,extends:❯,precedes:❮"
opt.wrap = false
opt.showcmd = true -- show command in bottom bar, fix <bs> not quit cmdline pop window

-- scroll config
opt.scrolloff = 5 -- match with treesitter text-objects padding
opt.sidescrolloff = 8
opt.smoothscroll = true
opt.guicursor = {
	"n-v-c:block-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100",
	"i-ci:ver25-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100",
	"r:hor50-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100",
}

-- mouse
opt.mousemoveevent = true

-- autocmds
local function augroup(name)
	return vim.api.nvim_create_augroup("Lazy_" .. name, { clear = true })
end

-- restore cursor when leave
autocmd({ "VimLeave" }, {
	group = augroup("resotre_cursor"),
	callback = function()
		opt.guicursor = "a:ver25-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100"
	end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("highlight_on_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
	group = augroup("go_to_last_loc"),
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

-- close some filetypes with <q>
autocmd("FileType", {
	group = augroup("close_filetypes"),
	pattern = {
		"help",
		"man",
		"notify",
		"query",
		"spectre_panel",
		"checkhealth",
		"toggleterm",
		"qf",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

autocmd("CmdwinEnter", {
	group = augroup("close_cmdwin"),
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = event.buf, silent = true })
	end,
})

-- check os type, set shell
if vim.fn.exists("g:os") == 0 then
	local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
	if is_windows then
		vim.g.os = "Windows"
		vim.g.toggleshell = "pwsh"
	else
		local uname_output = vim.fn.system("uname")
		vim.g.os = string.gsub(uname_output, "\n", "")
		vim.g.toggleshell = "bash"
	end
end

-- enable lsp inlay hints when available
autocmd("LspAttach", {
	group = augroup("lsp_inlay_hints"),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.inlayHintProvider then
			if vim.lsp.inlay_hint then
				vim.lsp.inlay_hint.enable(args.buf, true)
			end
		end
	end,
})
