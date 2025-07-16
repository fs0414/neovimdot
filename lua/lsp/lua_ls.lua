return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        unusedLocalExclude = { '_*' },
        globals = {
          'vim',
          'require'
        },
      },
    }
  },
}
