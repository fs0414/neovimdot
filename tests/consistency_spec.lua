-- Dockerfile と lazy.lua の treesitter パーサーリスト整合性チェック
local config_dir = vim.fn.stdpath("config")

--- ファイルからクォート付きパーサー名を抽出するヘルパー
---@param filepath string
---@param pattern string Lua pattern to extract the block containing parser names
---@return table<string, boolean>
local function extract_parsers(filepath, pattern)
  local lines = vim.fn.readfile(filepath)
  local text = table.concat(lines, "\n")
  local block = text:match(pattern)
  assert(block, "Pattern not found in " .. filepath)
  local parsers = {}
  -- シングルクォートまたはダブルクォート内の文字列を抽出
  for parser in block:gmatch("['\"]([%w_]+)['\"]") do
    parsers[parser] = true
  end
  return parsers
end

describe("treesitter parser list consistency", function()
  local lazy_path = config_dir .. "/lua/config/lazy.lua"
  local dockerfile_path = config_dir .. "/Dockerfile"

  -- lazy.lua の ensure_installed リストを抽出
  local lazy_parsers = extract_parsers(lazy_path, "ensure_installed%s*=%s*(%b{})")
  -- Dockerfile の install({...}) からリストを抽出
  local docker_parsers = extract_parsers(dockerfile_path, "install%((%b{})%)")

  it("lazy.lua parsers should all be in Dockerfile", function()
    local missing = {}
    for parser in pairs(lazy_parsers) do
      if not docker_parsers[parser] then
        table.insert(missing, parser)
      end
    end
    assert.are.same({}, missing, "Parsers in lazy.lua but missing from Dockerfile: " .. table.concat(missing, ", "))
  end)

  it("Dockerfile parsers should all be in lazy.lua", function()
    local missing = {}
    for parser in pairs(docker_parsers) do
      if not lazy_parsers[parser] then
        table.insert(missing, parser)
      end
    end
    assert.are.same({}, missing, "Parsers in Dockerfile but missing from lazy.lua: " .. table.concat(missing, ", "))
  end)
end)
