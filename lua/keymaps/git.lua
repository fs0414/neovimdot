-- Git関連キーマップ

-- LazyGit (snacks.lazygit)
vim.keymap.set("n", "<leader>gl", function()
	require("snacks").lazygit()
end, { desc = "LazyGit" })

vim.keymap.set("n", "<leader>gg", function()
	require("snacks").lazygit()
end, { desc = "LazyGit" })

-- GitBrowse (snacks.gitbrowse)
vim.keymap.set("n", "<leader>go", function()
	require("snacks").gitbrowse()
end, { desc = "Git browse (open in browser)" })

-- Neogit / Diffview
vim.keymap.set("n", "<leader>gd", "<cmd>Neogit<CR>", { desc = "Neogit" })
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen<CR>", { desc = "Diffview open" })

-- Git status picker (ファイルに直接飛べる)
vim.keymap.set("n", "<leader>gs", function()
	require("snacks").picker.git_status()
end, { desc = "Git status (picker)" })

-- NotePush
vim.keymap.set("n", "<leader>np", "<cmd>NotePush<CR>", { desc = "Note push (git add/commit/push)" })
