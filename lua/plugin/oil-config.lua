require("oil").setup()
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map('n', '<c-e>', '<CMD>Oil<CR>', opts)
