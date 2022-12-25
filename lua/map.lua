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
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opt)

local telescope = require('telescope.builtin')
map('n', '<leader>f', telescope.find_files, opt)
map('n', '<leader>g', telescope.live_grep, opt)

-- lsp map
map('i', '<c-j>', vim.lsp.buf.signature_help, opt)
map('n', 'K', vim.lsp.buf.hover, opt)
map('n', 'gd', vim.lsp.buf.definition, opt)
map('n', 'gD', vim.lsp.buf.declaration, opt)
map('n', '<leader>=', vim.lsp.buf.format, opt)
map('n', 'gi', vim.lsp.buf.implementation, opt)
map('n', 'gr', vim.lsp.buf.references, opt)
map('n', '<leader>r', vim.lsp.buf.rename, opt)
map('n', '<leader>D', vim.lsp.buf.type_definition, opt)
map('n', '<leader>a', vim.lsp.buf.code_action, opt)
