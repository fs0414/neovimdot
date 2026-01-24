-- デバッグ関連キーマップ
local map = vim.api.nvim_set_keymap
local opts = { silent = true }

-- DAP
map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
map("n", "<F6>", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<F7>", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<F8>", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)

-- DAP UI
map("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", opts)
map("n", "<leader><leader>dc", ":lua require'dapui'.close()<CR>", opts)
map("n", "<leader><leader>dt", ":lua require'dap'.continue()<CR>", opts)
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", opts)

-- DAP Go
map("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", opts)
