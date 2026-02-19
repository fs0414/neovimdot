-- テスト用最小 Neovim 初期化
-- busted --lua nlua --helper tests/minimal_init.lua で使用

local data_dir = vim.fn.stdpath("data")
local lazy_dir = data_dir .. "/lazy"

-- テスト対象の nvim config を rtp に追加
vim.opt.rtp:prepend(vim.fn.stdpath("config"))

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
