-- vim.api.nvim_set_var('loaded_netrw', 1)

-- fern
vim.g["fern#default_hidden"] = 1
vim.g["fern#show_hidden"] = 1

require('plugin')
--require('color-schema')
require('base')
require('lsp-config')
require('statusline')
require('telescope-config')
require('toggleterm-config')
require('keymap')
require('neotest-config')
require('cmp-config')
require('dap-config')
require('noice-config')
require('gittool')
--require('fern-config')
--require('neotest-config')
-- require('tree-config')

