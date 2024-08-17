vim.g["fern#default_hidden"] = 1
vim.g["fern#show_hidden"] = 1

vim.opt.runtimepath:append("~/lua/extension/ts-trycatch-encoder/main.ts")

require('plugin')
require('base')
require('keymap')
require('plugin/lsp-config')
require('plugin/statusline')
require('plugin/fzf-lua-config')
require('plugin/toggleterm-config')
require('plugin/neotest-config')
require('plugin/dap-config')
require('plugin/gittool')
require('plugin/notice-config')
