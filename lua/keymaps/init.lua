-- 基本キーマップ設定
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- モード切替
map("i", "<C-j>", "<Esc>", opts)
map("v", "<C-j>", "<Esc>", opts)
map("t", "<A-Esc>", "<C-\\><C-n>", opts)

-- ウィンドウ操作
vim.keymap.set("n", "<CR>", "<C-w>w")

-- バッファ操作
map("n", "<C-j>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<C-k>", "<Cmd>BufferNext<CR>", opts)
map("n", "<leader>e", "<Cmd>BufferClose<CR>", opts)

-- 検索
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })

-- リロード
map("n", "<leader>s", ":source %<CR>", opts)

-- try-catch wrap
vim.api.nvim_set_keymap(
	"n",
	"<Leader>try",
	[[:normal! Vito try {\r} catch (err) {\r    console.error(err);\r}<Esc>]],
	{ noremap = true, silent = true }
)

-- サブモジュール読み込み
require("keymaps.lsp")
require("keymaps.picker")
require("keymaps.git")
require("keymaps.file-explorer")
require("keymaps.terminal")
