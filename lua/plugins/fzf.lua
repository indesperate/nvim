return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            file_icon_padding = " ",
        },
        cmd = "FzfLua",
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
                    require("fzf-lua").git_status()
                end,
                desc = "Search git status",
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
