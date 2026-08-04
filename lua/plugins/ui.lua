return {
    -- under status line
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "catppuccin-nvim",
                globalstatus = true,
            },
            winbar = {
                lualine_c = { "buffers" },
            },
            inactive_winbar = {
                lualine_c = { "buffers" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "diff", "diagnostics" },
                lualine_c = { "%S" },
                lualine_x = { "searchcount", "lsp_status", "fileformat", "filetype", "encoding" },
                lualine_y = { "progress" },
                lualine_z = { "branch" },
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
