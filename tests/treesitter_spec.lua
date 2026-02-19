-- Treesitter パーサーの利用可能性を検証
describe("treesitter parsers", function()
  -- lazy.lua の ensure_installed と同一リスト
  local parsers = {
    "lua", "javascript", "typescript", "tsx", "rust", "go", "ruby",
    "html", "css", "json", "yaml", "toml", "markdown", "bash", "vim", "vimdoc",
  }

  for _, lang in ipairs(parsers) do
    it("has " .. lang .. " parser", function()
      assert.is_true(pcall(vim.treesitter.language.add, lang))
    end)
  end
end)
