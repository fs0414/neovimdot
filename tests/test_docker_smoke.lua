-- Docker スモークテスト (busted 不要の単純な Lua スクリプト)
-- 使用法: nvim --headless +"luafile /root/.config/nvim/tests/test_docker_smoke.lua"

local errors = {}
local total = 0

local function check(name, fn)
  total = total + 1
  local ok, err = pcall(fn)
  if ok then
    print("PASS: " .. name)
  else
    print("FAIL: " .. name .. " - " .. tostring(err))
    table.insert(errors, name)
  end
end

-- 1. Treesitter パーサーが読み込めるか
local parsers = {
  "lua", "javascript", "typescript", "tsx", "rust", "go", "ruby",
  "html", "css", "json", "yaml", "toml", "markdown", "bash", "vim", "vimdoc",
}
for _, lang in ipairs(parsers) do
  check("treesitter:" .. lang, function()
    vim.treesitter.language.add(lang)
  end)
end

-- 2. LSP 設定ファイルが読み込めるか
local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
local handle = vim.uv.fs_scandir(lsp_dir)
if handle then
  while true do
    local name, ftype = vim.uv.fs_scandir_next(handle)
    if not name then break end
    if ftype == "file" and name:match("%.lua$") then
      local filepath = lsp_dir .. "/" .. name
      check("lsp-config:" .. name:gsub("%.lua$", ""), function()
        local config = dofile(filepath)
        assert(config and config.cmd, "missing cmd")
      end)
    end
  end
end

-- 3. Docker イメージにインストール済みの LSP サーバーバイナリが存在するか
local expected_binaries = {
  "lua-language-server",
  "typescript-language-server",
  "stylua",
  "prettierd",
  "prettier",
}
for _, bin in ipairs(expected_binaries) do
  check("binary:" .. bin, function()
    assert(vim.fn.executable(bin) == 1, bin .. " not found in PATH")
  end)
end

-- 4. フル init.lua のロード (全モジュールチェーン)
check("full-init", function()
  dofile(vim.fn.stdpath("config") .. "/init.lua")
end)

-- 5. Lazy.nvim プラグインがインストール済みか
check("lazy-plugins", function()
  local lazy_dir = vim.fn.stdpath("data") .. "/lazy"
  local stat = vim.uv.fs_stat(lazy_dir)
  assert(stat, "lazy plugin directory not found")
  -- 最低限のプラグイン数が存在すること
  local count = 0
  local h = vim.uv.fs_scandir(lazy_dir)
  if h then
    while vim.uv.fs_scandir_next(h) do
      count = count + 1
    end
  end
  assert(count >= 10, "expected at least 10 plugins, found " .. count)
end)

-- 結果サマリ
print(string.format("\n=== %d/%d checks passed ===", total - #errors, total))

if #errors > 0 then
  print("FAILED: " .. table.concat(errors, ", "))
  vim.cmd("cquit 1")
else
  vim.cmd("qall!")
end
