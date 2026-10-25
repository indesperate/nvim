return {
    "folke/snacks.nvim",
    init = function()
        require("local_plugins.yazi").setup()
    end,
    keys = {
        {
            "<leader>n",
            function()
                require("local_plugins.yazi").toggle()
            end,
            desc = "Open Yazi",
        },
    },
}
