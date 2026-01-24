---@type vim.lsp.Config
return {
  cmd = { '/Users/fujitanisora/.local/share/mise/installs/node/22.15.0/bin/typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
}
