-- complete
local lspkind = require('lspkind')
local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }
    }, {
        { name = 'buffer' },
        { name = 'path' }
    }),
    mapping = cmp.mapping.preset.insert({
        ['<tab>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
    }),
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        })
    },
}

-- use when in search mode
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- use when in command mode
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
