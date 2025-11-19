-- diagnostic
vim.diagnostic.config({ virtual_text = true })

-- lsp config
vim.lsp.enable("basedpyright")
vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ruff")
vim.lsp.enable("lua_ls")
