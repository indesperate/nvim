-- nvim-treesitter config
require('nvim-treesitter')
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}
require("nvim-treesitter.install").prefer_git = true
