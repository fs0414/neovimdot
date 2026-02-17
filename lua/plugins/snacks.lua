-- Snacks 設定
local Snacks = require("snacks")

Snacks.setup({
	-- インデントガイド無効
	indent = {
		enabled = false,
	},
	-- キーマップヘルプ (which-key風)
	input = {
		enabled = true,
	},
	-- ターミナル (toggleterm置き換え)
	terminal = {
		enabled = true,
		win = {
			style = "float",
			border = "rounded",
			width = 0.9,
			height = 0.9,
		},
	},
	-- Git (gitsigns置き換え)
	git = {
		enabled = true,
	},
	-- GitBrowse (git_browse置き換え)
	gitbrowse = {
		enabled = true,
	},
	-- LazyGit (neogit置き換え)
	lazygit = {
		enabled = true,
	},
})

-- mini.icons
require("mini.icons").setup({})
