-- vim.g["fern#default_hidden"] = 1
-- vim.g["fern#show_hidden"] = 1

local vim = vim

-- call denops#request('denops-getting-started', 'hello', [])
vim.opt.runtimepath:append("~/denops-getting-started")

-- Denopsの起動を確実にする
vim.g['denops#server#service#deno_args'] = {
  '-q',
  '--no-lock',
  '-A',
  '--unstable-ffi',
}

-- Denopsのバージョンチェックを無効化（必要に応じて）
vim.g['denops_disable_version_check'] = 1

-- Load lazy.nvim configuration (this must come first to load plugins)
require("config.lazy")
-- Note: plugin.lua is now deprecated as plugins are managed in config/lazy.lua
-- require('plugin')
require('base')
require('keymap')
require('lsp')
require('statusline')
--require('fzf-lua-config')
require('toggleterm-config')
-- DAP/neotestは遅延読み込み（コマンド実行時に読み込み）
vim.api.nvim_create_user_command('DapLoad', function()
  require('dap-config')
end, { desc = 'Load DAP configuration' })
vim.api.nvim_create_user_command('NeotestLoad', function()
  require('neotest-config')
end, { desc = 'Load Neotest configuration' })
require('gittool')
--require('notice-config')
-- require('nvim-web-devicons-config')
require('hlchunk-config')
require('oil-config')
require('formatter')
require('snacks-picker')
require('blink-conf') -- nvim-cmpを使用するためコメントアウト
