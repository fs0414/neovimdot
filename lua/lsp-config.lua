local lspconfig = require('lspconfig')

local cmp = require 'cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      --completion = cmp.config.window.bordered({
      --  order = 'single'
      --}),
      --documentation = cmp.config.window.bordered({
      --  border = 'single'
      --}),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
})

---

--cmp.setup {
--  window = {
--    completion = cmp.config.window.bordered({
--        order = 'single'
--    }),
--    documentation = cmp.config.window.bordered({
--      border = 'single'
--    }),
--  },
--
--  mapping = map.preset.insert {
--    ['<C-d>'] = map.scroll_docs(-4),
--    ['<C-f>'] = map.scroll_docs(4),
--    ['<C-Space>'] = map.complete(),
--    ['<C-e>'] = map.abort(),
--    ['<CR>'] = map.confirm { select = false },
--  },
--
--  sources = cmp.config.sources({
--    { name = 'nvim_lsp' },
--    { name = "nvim_lsp_signature_help" },
--  })
--}

---

require'lspconfig'.gopls.setup{}
require("mason").setup({})
require("mason-lspconfig").setup({})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup{
      capabilities = capabilities,
    }
  end,
})