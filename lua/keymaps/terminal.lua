-- ターミナル関連キーマップ

-- ターミナルモードでESCでノーマルモードに戻る
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ターミナルトグル (snacks.terminal)
vim.keymap.set("n", "<C-t>", function()
	require("snacks").terminal()
end, { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-t>", function()
	require("snacks").terminal()
end, { desc = "Toggle terminal" })
