-- フル設定の主要モジュールが require 可能であることを検証
describe("startup modules", function()
  local modules = {
    "core.options",
    "core.autocmds",
    "core.commands",
    "keymaps",
    "lsp",
    "plugins",
  }

  for _, mod in ipairs(modules) do
    it("can require " .. mod, function()
      -- キャッシュをクリアして再読み込み
      package.loaded[mod] = nil
      assert.has_no.errors(function()
        require(mod)
      end)
    end)
  end
end)
