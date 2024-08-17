require'fzf-lua'.setup({
  winopts = {
    height     = 0.85,
    width      = 0.80,
    row        = 0.35,
    col        = 0.50,
    border     = 'rounded',
    fullscreen = false,  },
  })

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<C-p>', "<cmd>lua require('fzf-lua').files()<CR>", opts)
map('n', '<C-g>', "<cmd>lua require('fzf-lua').grep()<CR>", opts)
map('n', '<C-f>', "<cmd>lua require('fzf-lua').blines()<CR>", opts)
map('n', '<leader>r', "<cmd>lua require('fzf-lua').lsp_references()<CR>", opts)
map('n', '<leader>c', "<cmd>lua require('fzf-lua').lsp_declarations()<CR>", opts)
map('n', '<leader>i', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", opts)
map('n', '<leader>D', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", opts)
map('n', '<leader>t', "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>", opts)
map('n', '<leader>l', "<cmd>lua require('fzf-lua').diagnostics_document()<CR>", opts)
