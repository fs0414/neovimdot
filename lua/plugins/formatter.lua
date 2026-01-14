-- Conform (フォーマッタ) 設定
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
		sh = { "shfmt" },
		go = { "gofumpt", "goimports", lsp_format = "fallback" },
	},
})
