-- hlchunk (インデントガイド) 設定
require("hlchunk").setup({
	chunk = {
		chars = {
			horizontal_line = "─",
			vertical_line = "│",
			left_top = "┌",
			left_bottom = "└",
			right_arrow = "─",
		},
		style = "#888888",
		enable = true,
	},
	indent = {
		enable = true,
		chars = {
			" ",
		},
	},
})
