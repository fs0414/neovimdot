local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- telescope find_files
map('n', '<c-p>', '<cmd>Telescope find_files<cr>', opts)

-- telescope live_grepのキーマップ
map('n', '<c-g>', '<cmd>Telescope live_grep<cr>', opts)

-- telescope buffers
map('n', '<c-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)

-- help_tags
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- fern
map('n', '<Leader>u', ':Fern . -drawer -reveal=% -width=40<CR>', opts)
map('n', '<c-e>', ':Fern . -reveal=s<CR>', opts)

-- neotest
map("n", "<leader> tt", "<cmd>lua require('neotest').run.run()<CR>", opts)
map("n", "<leader> tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)

-- window move
map('n', 'sl', '<C-w>l', opts)
map('n', 'sh', '<C-w>h', opts)
map('n', 'sj', '<C-w>j', opts)
map('n', 'sk', '<C-w>k', opts)

-- definition jump
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- split and goto definition
function split_and_goto_definition(split_cmd)
  vim.cmd(split_cmd)
  vim.lsp.buf.definition()
end
map('n', '<C-h>gd', '<cmd>lua split_and_goto_definition("leftabove vsplit")<CR>', opts)
map('n', '<C-j>gd', '<cmd>lua split_and_goto_definition("belowright split")<CR>', opts)
map('n', '<C-k>gd', '<cmd>lua split_and_goto_definition("aboveleft split")<CR>', opts)
map('n', '<C-l>gd', '<cmd>lua split_and_goto_definition("rightbelow vsplit")<CR>', opts)

map('n', '<leader>s', ':source %<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)

-- diagnostic none
map('n', '<leader>n', '<cmd>lua vim.diagnostic.config{virtual_text=false}<CR>', opts)

-- dap
map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true})
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true})
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true})
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true})
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true})
map("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true})
map("n", "<leader>l", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true})

-- dap-ui key map
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true})
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true})

-- dap-go key map
map("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", { silent = true })
