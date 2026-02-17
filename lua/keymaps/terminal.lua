-- ターミナル関連キーマップ

-- ターミナルモードでESCでノーマルモードに戻る
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ターミナルトグル (snacks.terminal)
vim.keymap.set("n", "<C-t>", function()
	Snacks.terminal.toggle(nil, { cwd = vim.fn.getcwd(), count = 1 })
end, { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-t>", function()
	Snacks.terminal.toggle(nil, { cwd = vim.fn.getcwd(), count = 1 })
end, { desc = "Toggle terminal" })
