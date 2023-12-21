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

-- lsp map
map("i", "<c-j>", vim.lsp.buf.signature_help, { desc = "Lsp help", silent = true })
map("n", "K", vim.lsp.buf.hover, { desc = "Lsp hover", silent = true })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp declar", silent = true })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Lsp rename", silent = true })
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Lsp action", silent = true })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", silent = true })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", silent = true })
map("n", "gr", vim.lsp.buf.references, { desc = "Lsp refer", silent = true })
map("n", "gd", vim.lsp.buf.definition, { desc = "Lsp def", silent = true })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Lsp impl", silent = true })

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

if os.getenv("TMUX") then
	vim.g.tmux_navigator_no_mappings = 1
	map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
	map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
	map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
	map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
end
