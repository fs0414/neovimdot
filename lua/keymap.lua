local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<c-p>', '<cmd>Telescope find_files<cr>', opts)

-- live_grepのキーマップ
map('n', '<c-g>', '<cmd>Telescope live_grep<cr>', opts)

-- buffersのキーマップ
map('n', '<c-g>', '<cmd>Telescope frecency<cr>', opts)

-- help_tagsのキーマップ
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
