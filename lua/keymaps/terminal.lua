-- ターミナル関連キーマップ

-- ターミナルモードでESCでノーマルモードに戻る
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
