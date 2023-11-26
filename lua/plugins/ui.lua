-- theme
require('catppuccin').setup {
    integrations = {
        mason = true,
        telescope = true,
        nvimtree = true,
        treesitter = true
    },
    native_lsp = {
        enabled = true,
    },
}
vim.cmd.colorscheme 'catppuccin'

-- line down
require('lualine').setup {
    options = {
        theme = 'catppuccin'
    }
}

-- line up
require('bufferline').setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
        diagnostics = "nvim_lsp",
        offsets = { {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        } }
    }
}

-- file explorer
require('nvim-tree').setup()

require('colorizer').setup()

require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
})
