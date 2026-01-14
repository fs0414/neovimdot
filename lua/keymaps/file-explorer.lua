-- ファイルエクスプローラ関連キーマップ
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Oil
map("n", "<S-e>", "<CMD>Oil<CR>", opts)
