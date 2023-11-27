local map = vim.keymap.set
local opt = { silent = true }

-- useful map
map('n', '<leader>j', '<cmd>bnext<cr>', opt)
map('n', '<leader>k', '<cmd>bprevious<cr>', opt)
map('n', '<leader>l', '<cmd>luafile %<cr>', opt)
map('n', '<leader>w', '<cmd>w!<cr>', opt)
map('n', '<leader>q', '<cmd>q!<cr>', opt)
map('n', '<c-h>', '<c-w><c-h>', opt)
map('n', '<c-j>', '<c-w><c-j>', opt)
map('n', '<c-k>', '<c-w><c-k>', opt)
map('n', '<c-l>', '<c-w><c-l>', opt)
map('v', 'K', 'k', opt)

-- plugins
map('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', opt)

require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, opt)
map('n', '<leader>fg', builtin.live_grep, opt)
map('n', '<leader>fb', builtin.buffers, opt)
map('n', '<leader>fh', builtin.help_tags, opt)
map('n', '<leader>fc', builtin.command_history, opt)
map('n', '<leader>fz', builtin.current_buffer_fuzzy_find, opt)

-- lsp map
map('n', 'gr', builtin.lsp_references, opt)
map('n', 'gd', builtin.lsp_definitions, opt)
map('n', '<leader>D', builtin.lsp_type_definitions, opt)
map('n', 'gi', builtin.lsp_implementations, opt)
map('n', '<leader>.', builtin.quickfix, opt)

map('i', '<c-j>', vim.lsp.buf.signature_help, opt)
map('n', 'K', vim.lsp.buf.hover, opt)
map('n', 'gD', vim.lsp.buf.declaration, opt)
map('n', '<leader>=', vim.lsp.buf.format, opt)
map('n', '<leader>r', vim.lsp.buf.rename, opt)
map('n', '<leader>a', vim.lsp.buf.code_action, opt)

-- useful map
map('v', 'J', ":m '>+1<cr>gv=gv", opt)
map('v', 'K', ":m '<-2<cr>gv=gv", opt)


if os.getenv("TMUX") then
    vim.g.tmux_navigator_no_mappings = 1
    map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
    map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
    map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
    map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end
