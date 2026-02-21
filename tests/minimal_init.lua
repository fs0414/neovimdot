-- テスト用最小 Neovim 初期化
-- busted --lua nlua --helper tests/minimal_init.lua で使用

-- テスト対象のリポジトリルートを算出 (tests/minimal_init.lua → repo root)
local config_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h")

-- busted の require が lua/ 以下のモジュールを解決できるようにする
package.path = config_dir .. "/lua/?.lua;" .. config_dir .. "/lua/?/init.lua;" .. package.path

local data_dir = vim.fn.stdpath("data")
local lazy_dir = data_dir .. "/lazy"

-- テスト対象の nvim config を rtp に追加
vim.opt.rtp:prepend(config_dir)

-- lazy.nvim のプラグインを rtp に追加 (startup_spec 等で必要)
local handle = vim.uv.fs_scandir(lazy_dir)
if handle then
  while true do
    local name, ftype = vim.uv.fs_scandir_next(handle)
    if not name then break end
    if ftype == "directory" then
      vim.opt.rtp:append(lazy_dir .. "/" .. name)
    end
  end
end

-- テスト用にリポジトリルートを公開 (CI で stdpath("config") と異なる場合の代替)
vim.g.test_config_dir = config_dir
