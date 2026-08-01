return {
    -- upper bufferline
    {
        "akinsho/bufferline.nvim",
        after = "catppuccin",
        config = function()
            require("bufferline").setup({
                highlights = require("catppuccin.special.bufferline").get_theme(),
            })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- under status line
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "catppuccin-nvim",
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "diff", "diagnostics" },
                lualine_c = { "%S" },
                lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "branch" },
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
