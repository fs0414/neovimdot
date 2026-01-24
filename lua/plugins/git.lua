-- Git関連プラグイン設定
require("gitsigns").setup({})

local status, git = pcall(require, "git")
if status then
	git.setup({
		keymaps = {
			blame = "<Leader>gb",
			browse = "<Leader>go",
		},
	})
end

