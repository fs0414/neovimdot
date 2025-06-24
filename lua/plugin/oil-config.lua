require("oil").setup({
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["<C-t>"] = false,
    ["<Del>"] = false
  },
})
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<c-e>', '<CMD>Oil<CR>', opts)
