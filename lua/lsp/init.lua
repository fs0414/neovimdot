-- LSP設定 (Neovim 0.11+ 組み込み機能を使用)

-- masonのbinディレクトリをPATHに追加
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Capabilities (blink.cmp連携)
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- グローバル設定
vim.lsp.config("*", {
	capabilities = capabilities,
})

-- 有効化するサーバー一覧
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"denols",
	"biome",
	"oxlint",
	"rust_analyzer",
	"ruby_lsp",
	"gopls",
})

-- LSP情報表示コマンド
vim.api.nvim_create_user_command("LspInfo", function()
	local clients = vim.lsp.get_clients()
	if #clients == 0 then
		print("No LSP clients attached")
		return
	end
	for _, c in ipairs(clients) do
		print(string.format("%s: %s", c.name, c.root_dir or "N/A"))
	end
end, { desc = "Show attached LSP clients" })

-- Diagnostic設定
require("lsp.diagnostics")

-- Hover設定
require("lsp.hover")
