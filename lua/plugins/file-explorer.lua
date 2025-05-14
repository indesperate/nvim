return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    keys = {
      {
        "<leader>nf",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>ng",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git explorer",
      },
      {
        "<leader>nc",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer explorer",
      },
      {
        "<leader>ns",
        function()
          require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
        end,
        desc = "Symbols explorer",
      },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    opts = {
      cloase_if_last_windows = true,
      popup_border_style = "",
      open_files_do_not_replace_types = { "terminal", "trouble", "qf", "OverseerList", "OverseerForm" },
      filesystem = {
        group_empty_dirs = true,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = false,
          ["o"] = {
            "toggle_node",
            nowait = true,
          },
        },
      },
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    },
  },
}
