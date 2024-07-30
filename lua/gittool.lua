require('gitsigns').setup {}
local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Open file/folder in git repository
    browse = "<Leader>go",
  }
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- lazygit
map('n', '<leader>g', ':Lazygit<CR>', opts)

