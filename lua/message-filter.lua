local function filter_diagnostics(diagnostic)
  if string.match(diagnostic.message, "Undefined global `vim`.") then
    return false
  end
  return true
end

vim.diagnostic.config({
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  custom_diagnostic_handler,
  {}
)
