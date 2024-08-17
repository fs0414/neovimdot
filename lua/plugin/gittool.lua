require('gitsigns').setup {}
local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    blame = "<Leader>gb",
    browse = "<Leader>go",
  }
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lazygit
map('n', '<leader>g', ':Lazygit<CR>', opts)

-- diffview
require("diffview").setup()
map('n', '<leader>df', ':DiffviewOpen<CR>', opts)

-- neogit
local neogit = require('neogit')
neogit.setup {}
require("diffview").setup()

