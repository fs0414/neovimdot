local vim = vim

-- プロジェクトルート検出関数
local function has_file(filename)
  return vim.fn.findfile(filename, vim.fn.getcwd() .. ';') ~= ''
end

-- -- Lua LSPは常に有効
-- local lua_ls_opts = require('lsp.lua_ls')
-- vim.lsp.config('lua_ls', lua_ls_opts)
--
-- local ts_ls_opts = require('lsp.ts_ls')
-- vim.lsp.config('ts_ls', ts_ls_opts)
--
-- local deno_ls_opts = require('lsp.deno')
-- vim.lsp.config('deno_ls', deno_ls_opts)
--
-- if has_file('package.json') then
--   vim.lsp.enable('ts_ls')
-- elseif has_file('deno.json') or has_file('deno.jsonc') or has_file('deps.ts') then
--   vim.lsp.enable('deno_ls')
-- end
--
-- -- Biome
-- local biome_ls_opts = require('lsp.biome')
-- vim.lsp.enable('biome_ls', biome_ls_opts)
-- --
-- -- local gopls_opts = require('lsp.gopls')
-- -- vim.lsp.enable('gopls', gopls_opts)
--
-- local eslint_opts = require('lsp.eslint')
-- vim.lsp.enable('eslint', eslint_opts)

local configs = {}

for _, v in ipairs(vim.api.nvim_get_runtime_file('*', true)) do
  local name = vim.fn.fnamemodify(v, ':t:r')
  configs[name] = true
end

vim.lsp.enable(vim.tbl_keys(configs))

