---@type vim.lsp.Config
return {
  root_markers = {
    'deno.json',
    'deno.jsonc',
    'deno.lock',
    'deps.ts',
    'import_map.json',
  },
  workspace_required = true,
}