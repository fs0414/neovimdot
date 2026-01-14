-- Git関連キーマップ
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lazygit (terminal)
map("n", "<leader>gl", "<cmd>terminal lazygit<CR><cmd>startinsert<CR>", opts)

-- Neogit
map("n", "<leader>gg", ":Neogit<CR>", opts)

-- Diffview
map("n", "<leader>gd", ":DiffviewOpen<CR>", opts)

-- NotePush
map("n", "<leader>np", ":NotePush<CR>", opts)
