return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        {
            "<leader>n",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume yazi at the last location",
        },
    },
    opts = {
        open_for_directories = true,
        integrations = {
            grep_in_directory = "fzf-lua",
            grep_in_selected_files = "fzf-lua",
        },
        floating_window_scaling_factor = 0.75,
        future_features = {
            use_cwd_file = false,
        },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
