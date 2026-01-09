-- pnpmのフルパスを取得
local pnpm_path = vim.fn.exepath('pnpm')
if pnpm_path == '' then
  pnpm_path = 'pnpm'
end

---@type vim.lsp.Config
return {
  cmd = { pnpm_path, 'biome', 'lsp-proxy' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'jsonc' },
  root_markers = { 'biome.json', 'biome.jsonc' },
  workspace_required = true,
}
