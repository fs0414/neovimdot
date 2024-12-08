require("oil").setup({
  keymaps = {
    ["<C-t>"] = false,
    ["<Del>"] = false
  },
})
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<c-e>', '<CMD>Oil<CR>', opts)
