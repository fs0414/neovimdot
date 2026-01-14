-- Git関連キーマップ

-- lazygit (terminal)
vim.keymap.set("n", "<leader>gl", "<cmd>terminal lazygit<CR><cmd>startinsert<CR>", { desc = "LazyGit (terminal)" })

-- Neogit
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })

-- Diffview
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview open" })

-- NotePush
vim.keymap.set("n", "<leader>np", "<cmd>NotePush<CR>", { desc = "Note push (git add/commit/push)" })
