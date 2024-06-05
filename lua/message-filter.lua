local function filter_diagnostics(diagnostic)
  -- ここにフィルタリングの条件を記述
  -- 例: 'unused'を含むメッセージを除外
  if string.match(diagnostic.message, "Undefined global `vim`.") then
    return false
  end
  return true
end

vim.diagnostic.config({
  virtual_text = {
    -- カスタムハンドラをvirtual_textの表示に適用
    severity = vim.diagnostic.severity.ERROR,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",  -- 診断ソースを表示
  },
})

-- LSPの診断情報が更新されたときにカスタムハンドラを呼び出す
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  custom_diagnostic_handler,
  { -- ここに任意のオプションを指定
  }
)
