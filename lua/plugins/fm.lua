-- file manager
return {
    {
        "stevearc/oil.nvim",
        opts = {
            skip_confirm_for_simple_edits = true,
            float = {
                max_width = 0.7,
                max_height = 0.7,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },
}
