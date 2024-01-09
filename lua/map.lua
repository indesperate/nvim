local map = vim.keymap.set

-- useful map
map("n", "H", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "L", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[q", "<cmd>cprevious<cr>", { desc = "Prev quick fix" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quick fix" })
map("n", "<leader>l", "<cmd>luafile %<cr>", { desc = "Load lua file", silent = true })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>bd<cr>", { desc = "Quit buffer", silent = true })
map("n", "<c-h>", "<c-w><c-h>", { desc = "Left window", silent = true })
map("n", "<c-j>", "<c-w><c-j>", { desc = "Down window", silent = true })
map("n", "<c-k>", "<c-w><c-k>", { desc = "Up window", silent = true })
map("n", "<c-l>", "<c-w><c-l>", { desc = "Right window", silent = true })
map("v", "K", "k", { desc = "Don't check", silent = true })

-- lsp map
map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Lsp help", silent = true })
map("n", "K", vim.lsp.buf.hover, { desc = "Lsp hover", silent = true })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp declar", silent = true })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Lsp rename", silent = true })
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Lsp action", silent = true })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", silent = true })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", silent = true })
map("n", "gr", vim.lsp.buf.references, { desc = "Lsp refer", silent = true })
map("n", "gd", vim.lsp.buf.definition, { desc = "Lsp def", silent = true })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Lsp impl", silent = true })

-- tab manipulate
map("n", "<c-n>c", "<cmd>tabnew<cr>", { desc = "New tab", silent = true })
map("n", "<c-n>n", "<cmd>tabnext<cr>", { desc = "Next tab", silent = true })
map("n", "<c-n>p", "<cmd>tabprevious<cr>", { desc = "Previous tab", silent = true })
map("n", "<c-n>x", "<cmd>tabclose<cr>", { desc = "Close tab", silent = true })

-- terminal mappings
map("t", "<c-n>", "<c-\\><c-n>", { desc = "Terminal escape", silent = true })
map("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left", silent = true })
map("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down", silent = true })
map("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up", silent = true })
map("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right", silent = true })
map("t", "<c-w>", "<c-\\><c-n><c-w>", { desc = "Terminal window", silent = true })

-- useful map
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "move down", silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "move up", silent = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- undo break-points, break undo history to pieces
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

if os.getenv("TMUX") then
	map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
	map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
	map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
	map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
end
