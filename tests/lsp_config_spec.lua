-- LSP 設定ファイルの構造を検証
local config_dir = vim.g.test_config_dir or vim.fn.stdpath("config")

describe("lsp config files", function()
  -- lsp/ ディレクトリ内の全 .lua ファイルを検証
  local lsp_dir = config_dir .. "/lsp"
  local handle = vim.uv.fs_scandir(lsp_dir)
  local config_files = {}
  if handle then
    while true do
      local name, type = vim.uv.fs_scandir_next(handle)
      if not name then break end
      if type == "file" and name:match("%.lua$") then
        table.insert(config_files, name)
      end
    end
  end

  for _, filename in ipairs(config_files) do
    local server_name = filename:gsub("%.lua$", "")

    describe(server_name, function()
      local filepath = lsp_dir .. "/" .. filename
      local config

      before_each(function()
        config = dofile(filepath)
      end)

      it("returns a table", function()
        assert.is_table(config)
      end)

      it("has cmd as non-empty array", function()
        assert.is_table(config.cmd)
        assert.is_true(#config.cmd > 0, "cmd should not be empty")
      end)

      it("has filetypes as non-empty array", function()
        assert.is_table(config.filetypes)
        assert.is_true(#config.filetypes > 0, "filetypes should not be empty")
      end)

      it("has root_markers as array", function()
        assert.is_table(config.root_markers)
      end)
    end)
  end
end)

describe("lsp enable list consistency", function()
  -- lua/lsp/init.lua の vim.lsp.enable() に列挙されたサーバー名を抽出
  local init_path = config_dir .. "/lua/lsp/init.lua"
  local content = vim.fn.readfile(init_path)
  local text = table.concat(content, "\n")

  -- vim.lsp.enable({ ... }) 内のサーバー名を抽出
  local enable_block = text:match("vim%.lsp%.enable%(%{(.-)%}%)")
  assert(enable_block, "vim.lsp.enable() block not found in lua/lsp/init.lua")

  local enabled_servers = {}
  for server in enable_block:gmatch('"([%w_]+)"') do
    table.insert(enabled_servers, server)
  end

  local lsp_dir = config_dir .. "/lsp"

  for _, server in ipairs(enabled_servers) do
    it("has config file for enabled server: " .. server, function()
      local path = lsp_dir .. "/" .. server .. ".lua"
      local stat = vim.uv.fs_stat(path)
      assert.is_not_nil(stat, "Missing config file: lsp/" .. server .. ".lua")
    end)
  end
end)
