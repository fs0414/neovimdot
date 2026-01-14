---@type vim.lsp.Config
return {
	cmd = { "oxc_language_server" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "oxlintrc.json", ".oxlintrc.json", "package.json" },
	workspace_required = true,
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
