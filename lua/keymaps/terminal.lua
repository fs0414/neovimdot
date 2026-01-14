-- ターミナル関連キーマップ
local map = vim.api.nvim_set_keymap
local opts = { silent = true }

-- ターミナルモードでESCでノーマルモードに戻る
map("t", "<ESC>", [[<C-\><C-n>]], opts)
