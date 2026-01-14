-- Oil (ファイルエクスプローラ) 設定
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-p>"] = false,
		["<C-t>"] = false,
		["<Del>"] = false,
	},
})
