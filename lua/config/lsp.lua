-- diagnostic
vim.diagnostic.config({ virtual_text = true })

-- lsp config
vim.lsp.enable("bashls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("neocmake")
vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("denols")
vim.lsp.enable("tombi")
vim.lsp.enable("ty")
vim.lsp.enable("ruff")
vim.lsp.enable("nushell")
vim.lsp.enable("hls")
vim.lsp.codelens.enable(true)
vim.lsp.inlay_hint.enable(true)
