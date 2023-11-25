return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "williamboman/mason.nvim"
    use "neovim/nvim-lspconfig"
    use "williamboman/mason-lspconfig.nvim"
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'onsails/lspkind-nvim'
    use 'numToStr/Comment.nvim'
    use 'ggandor/leap.nvim'
    use 'kylechui/nvim-surround'
    use 'norcalli/nvim-colorizer.lua'
    use 'christoomey/vim-tmux-navigator'
end)

