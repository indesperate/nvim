local map = vim.keymap.set

-- useful map
map("n", "<leader>j", "<cmd>bnext<cr>", { desc = "Buffer next", silent = true })
map("n", "<leader>k", "<cmd>bprevious<cr>", { desc = "Buffer next", silent = true })
map("n", "<leader>l", "<cmd>luafile %<cr>", { desc = "Load lua file", silent = true })
map("n", "<leader>w", "<cmd>w!<cr>", { desc = "Write buffer", silent = true })
map("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit", silent = true })
map("n", "<c-h>", "<c-w><c-h>", { desc = "Left window", silent = true })
map("n", "<c-j>", "<c-w><c-j>", { desc = "Down window", silent = true })
map("n", "<c-k>", "<c-w><c-k>", { desc = "Up window", silent = true })
map("n", "<c-l>", "<c-w><c-l>", { desc = "Right window", silent = true })
map("v", "K", "k", { desc = "Don't check", silent = true })

-- plugins
require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find files", silent = true })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep", silent = true })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers", silent = true })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags", silent = true })
map("n", "<leader>fc", builtin.command_history, { desc = "Find command history", silent = true })
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Find in cbuffer", silent = true })

-- neotree
local neotree = function(opts)
	return function()
		require("neo-tree.command").execute(opts)
	end
end

map("n", "<leader>nf", neotree({ toggle = true }), { desc = "Neotree filesystem", silent = true })
map(
	"n",
	"<leader>ng",
	neotree({ source = "git_status", toggle = true }),
	{ desc = "Neotree git status", silent = true }
)
map("n", "<leader>nb", neotree({ source = "buffers", toggle = true }), { desc = "Neotree buffer", silent = true })
map(
	"n",
	"<leader>nd",
	neotree({ source = "document_symbols", toggle = true }),
	{ desc = "Neotree symbol", silent = true }
)

-- lsp map
map("n", "gr", builtin.lsp_references, { desc = "lsp refer", silent = true })
map("n", "gd", builtin.lsp_definitions, { desc = "lsp def", silent = true })
map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "lsp type def", silent = true })
map("n", "gi", builtin.lsp_implementations, { desc = "lsp impl", silent = true })

map("n", "<leader>=", function()
	require("conform").format({ lsp_fallback = "always" })
end, { desc = "format", silent = true })

map("i", "<c-j>", vim.lsp.buf.signature_help, { desc = "lsp help", silent = true })
map("n", "K", vim.lsp.buf.hover, { desc = "lsp hover", silent = true })
map("n", "gD", vim.lsp.buf.declaration, { desc = "lsp declar", silent = true })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "lsp rename", silent = true })
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "lsp action", silent = true })

-- useful map
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "move down", silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "move up", silent = true })

if os.getenv("TMUX") then
	vim.g.tmux_navigator_no_mappings = 1
	map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
	map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
	map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
	map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
end
