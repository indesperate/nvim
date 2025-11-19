local map = vim.keymap.set

-- oil configurations
local oil = require("oil")
map("n", "<leader>n", oil.toggle_float, { desc = "Toggle oil floating window" })

-- useful map
map("n", "H", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "L", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<c-h>", "<c-w><c-h>", { desc = "Left window", silent = true })
map("n", "<c-j>", "<c-w><c-j>", { desc = "Down window", silent = true })
map("n", "<c-k>", "<c-w><c-k>", { desc = "Up window", silent = true })
map("n", "<c-l>", "<c-w><c-l>", { desc = "Right window", silent = true })

-- lsp map
map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Lsp help", silent = true })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Lsp rename", silent = true })
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Lsp action", silent = true })
map("n", "gr", vim.lsp.buf.references, { desc = "Lsp refer", silent = true })
map("n", "gd", vim.lsp.buf.definition, { desc = "Lsp def", silent = true })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Lsp impl", silent = true })
map("n", "J", vim.diagnostic.open_float, { desc = "Open diagnostic", silent = true })
map("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

-- useful map
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "move down", silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "move up", silent = true })

map("v", "<c-c>", '"+y', { desc = "Copy to clipboard", silent = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- visual normal
map("v", ".", ":norm.<cr>", { desc = "Visual normal" })

if os.getenv("TMUX") then
    map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { silent = true })
    map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { silent = true })
    map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { silent = true })
    map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { silent = true })
end
