local vim = vim

-- プロジェクトルート検出関数
local function has_file(filename)
  return vim.fn.findfile(filename, vim.fn.getcwd() .. ';') ~= ''
end

-- プロジェクトタイプを判定（キャッシュ済みなら即返却）
local function get_project_type()
  if project_type_cache ~= nil then
    return project_type_cache
  end
  
  -- Deno設定ファイルの存在確認
  if has_file('deno.json') or has_file('deno.jsonc') or has_file('deno.lock') or has_file('deps.ts') or has_file('import_map.json') then
    project_type_cache = 'deno'
  -- Node.js/TypeScript設定ファイルの存在確認
  elseif has_file('package.json') or has_file('tsconfig.json') or has_file('jsconfig.json') then
    project_type_cache = 'node'
  else
    project_type_cache = 'default'
  end
  
  return project_type_cache
end

-- LSP設定を読み込み
local configs = {}

for _, v in ipairs(vim.api.nvim_get_runtime_file('*', true)) do
  local name = vim.fn.fnamemodify(v, ':t:r')
  configs[name] = true
end

-- ts_lsとdenolsを除外したLSPを有効化
local other_configs = vim.tbl_filter(function(name)
  return name ~= 'ts_ls' and name ~= 'denols'
end, vim.tbl_keys(configs))

vim.lsp.enable(other_configs)

-- プロジェクトタイプに応じてTypeScript/Deno LSPを有効化
local project_type = get_project_type()
if project_type == 'deno' then
  vim.lsp.enable('denols')
elseif project_type == 'node' then
  vim.lsp.enable('ts_ls')
else
  -- デフォルトでts_lsを使用
  vim.lsp.enable('ts_ls')
end

