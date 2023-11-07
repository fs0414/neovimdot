local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

local cmp = require 'cmp'
local map = cmp.mapping

cmp.setup {
  window = {
    completion = cmp.config.window.bordered({
      border = 'single'
    }),
    documentation = cmp.config.window.bordered({
      border = 'single'
    }),
  },
  mapping = map.preset.insert {
    ['<C-d>'] = map.scroll_docs(-4),
    ['<C-f>'] = map.scroll_docs(4),
    ['<C-Space>'] = map.complete(),
    ['<C-e>'] = map.abort(),
    ['<CR>'] = map.confirm { select = false },
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = "nvim_lsp_signature_help" },
  },
}
