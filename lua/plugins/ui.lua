-- theme
require('catppuccin').setup {
    flavour = "mocha",
    transparent_background = false,
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.10, -- percentage of the shade to apply to the inactive window
    },
    integrations = {
        telescope = {
            enabled = true,
        },
        leap = true,
        cmp = true,
        mason = true,
        nvimtree = true,
        treesitter = true,
        treesitter_context = true,
        notify = true,
        lsp_trouble = true
    },
    native_lsp = {
        enabled = true,
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
}
vim.cmd.colorscheme 'catppuccin'


-- line down
require('lualine').setup {
    options = {
        disabled_filetypes = {"NvimTree"},
        theme = 'catppuccin'
    },
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
