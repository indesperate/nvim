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
    highlights = require("catppuccin.groups.integrations.bufferline").get()
}

-- file explorer
require('nvim-tree').setup()
