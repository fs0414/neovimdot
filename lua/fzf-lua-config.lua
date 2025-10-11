local fzf = require("fzf-lua")

fzf.setup({
	winopts = {
		height = 0.85,
		width = 0.80,
		row = 0.35,
		col = 0.50,
		border = "rounded",
		fullscreen = false,
	},
})

fzf.setup({
	global_resume = true, -- 最後の検索を記憶
	global_resume_query = true,
	files = {
		-- ファイル検索の高速化
		cmd = "fd --type f --hidden --follow --exclude .git",
		cwd_only = true, -- カレントディレクトリのみ検索
		multiprocess = true, -- マルチプロセス有効化
	},
	grep = {
		-- grep検索の最適化
		multiprocess = true,
		debug = false,
		rg_glob = true, -- rgのglob機能を使用
		glob_flag = "--iglob",
		glob_separator = "%s%-%-",
	},
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- map("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", opts)
-- map("n", "<C-g>", "<cmd>lua require('fzf-lua').grep()<CR>", opts)
-- map("n", "<C-f>", "<cmd>lua require('fzf-lua').blines()<CR>", opts)
-- map("n", "<C-r>", "<cmd>lua require('fzf-lua').lsp_references()<CR>", opts)
-- map("n", "gd", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", opts)
-- map("n", "<C-c>", "<cmd>lua require('fzf-lua').lsp_declarations()<CR>", opts)
-- -- map('n', '<C-i>', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", opts)
-- map("n", "<C->", "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", opts)
-- map("n", "<C-t>", "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>", opts)
-- map("n", "<C-l>", "<cmd>lua require('fzf-lua').diagnostics_document()<CR>", opts)
