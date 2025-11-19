return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            file_icon_padding = " ",
        },
        keys = {
            {
                "<leader>ff",
                function()
                    require("fzf-lua").files()
                end,
                desc = "Find files",
            },
            {
                "<leader>fc",
                function()
                    require("fzf-lua").command_history()
                end,
                desc = "Search command history",
            },
            {
                "<leader>fd",
                function()
                    require("fzf-lua").lsp_workspace_diagnostics()
                end,
                desc = "Search workspace diagnostics",
            },
            {
                "<leader>fg",
                function()
                    require("fzf-lua").live_grep()
                end,
                desc = "Live grep",
            },
            {
                "<leader>fs",
                function()
                    require("fzf-lua").lsp_document_symbols()
                end,
                desc = "Search buffer symbols",
            },
        },
    },
}
