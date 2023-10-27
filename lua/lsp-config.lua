--require('mason').setup {
--  ui = {
--    check_outdated_packages_on_open = false,
--    border = 'single',
--  },
--}
--
--require('mason-lspconfig').setup_handlers {
--  function(server_name)
--    require('lspconfig')[server_name].setup {}
--  end,
--}

local lspconfig = require('lspconfig')
 -- golang LSP
 require'lspconfig'.gopls.setup{}

-- TypeScript, ReactJS, VueJS LSP
lspconfig.tsserver.setup{
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

-- Ruby LSP
 lspconfig.solargraph.setup{
  cmd = {"solargraph", "stdio"},
  filetypes = {"ruby"},
  root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
}
