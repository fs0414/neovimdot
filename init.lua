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
require('lsp-config')
require('lsp-optimize').setup() -- LSP最適化設定を追加
require('statusline')
--require('fzf-lua-config')
require('toggleterm-config')
require('neotest-config')
require('dap-config')
require('gittool')
--require('notice-config')
-- require('nvim-web-devicons-config')
require('hlchunk-config')
require('oil-config')
require('formatter')
require('snacks-picker')
require('blink-conf') -- nvim-cmpを使用するためコメントアウト
