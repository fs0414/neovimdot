-- Picker (snacks.picker) キーマップ

-- snacks.pickerをラップして安全に呼び出す
local function pick(method)
	return function()
		local picker = require("snacks.picker")
		if picker[method] then
			picker[method]()
		else
			vim.notify("snacks.picker." .. method .. " not available", vim.log.levels.WARN)
		end
	end
end

-- ファイル検索
vim.keymap.set("n", "<C-p>", pick("files"), { desc = "Find files" })
vim.keymap.set("n", "<C-l>", pick("recent"), { desc = "Recent files" })
vim.keymap.set("n", "<C-b>", pick("buffers"), { desc = "Buffers" })

-- テキスト検索
vim.keymap.set("n", "<C-g>", pick("grep"), { desc = "Grep" })
vim.keymap.set("n", "<C-f>", pick("lines"), { desc = "Lines in buffer" })
vim.keymap.set("n", "<leader>sw", pick("grep_word"), { desc = "Grep word under cursor" })

-- LSP (picker経由)
vim.keymap.set("n", "gd", pick("lsp_definitions"), { desc = "Go to definition" })
vim.keymap.set("n", "gr", pick("lsp_references"), { desc = "References" })
vim.keymap.set("n", "<C-c>", pick("lsp_declarations"), { desc = "Declarations" })
vim.keymap.set("n", "<leader>ds", pick("lsp_symbols"), { desc = "Document symbols" })
vim.keymap.set("n", "<leader>ws", pick("lsp_workspace_symbols"), { desc = "Workspace symbols" })

-- Git
vim.keymap.set("n", "<leader>gc", pick("git_log"), { desc = "Git commits" })
vim.keymap.set("n", "<leader>gs", pick("git_status"), { desc = "Git status" })

-- その他
vim.keymap.set("n", "<leader>:", pick("command_history"), { desc = "Command history" })
vim.keymap.set("n", "<leader>fh", pick("help"), { desc = "Help tags" })
