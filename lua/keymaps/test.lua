-- テスト関連キーマップ
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Neotest
map("n", "<leader>tt", function()
	require("neotest").run.run()
end, { desc = "Run nearest test" })

map("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run file tests" })

map("n", "<leader>twr", function()
	require("neotest").run.run({ vitestCommand = "vitest --watch" })
end, { desc = "Run Watch" })
