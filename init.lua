vim.g["fern#default_hidden"] = 1
vim.g["fern#show_hidden"] = 1

vim.opt.runtimepath:append("~/lua/extension/ts-trycatch-encoder/main.ts")

-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("TSEnable highlight")
--   end,
-- })

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained",
--   highlight = {
--     enable = true,
--   },
-- }

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
require('plugin/nvim-web-devicons')
