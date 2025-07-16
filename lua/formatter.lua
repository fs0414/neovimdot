require("conform").setup({
	formatters_by_ft = {
    -- lua
		lua = { "stylua" },
    -- python
		python = { "isort", "black" },
    -- rust
		rust = { "rustfmt", lsp_format = "fallback" },
    -- javascript
		javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
    -- sh
    sh = { "shfmt" },
    -- golang
    go = { "gofumpt", "goimports", lsp_format = "fallback" },
	},
})

local vim = vim
vim.api.nvim_create_user_command("Fmt", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
