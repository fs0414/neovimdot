-- Neovim Configuration Entry Point

-- Load lazy.nvim configuration (プラグイン読み込み)
require("config.lazy")

-- Core settings
require("core.options")
require("core.autocmds")
require("core.commands")

-- UI
require("ui.highlights")

-- Keymap
require("keymaps")

-- LSP
require("lsp")

-- Plugin configurations
require("plugins")

-- DAP/Neotest (遅延読み込み)
vim.api.nvim_create_user_command("DapLoad", function()
	require("plugins.dap")
	require("keymaps.debug")
end, { desc = "Load DAP configuration" })

vim.api.nvim_create_user_command("NeotestLoad", function()
	require("plugins.neotest")
	require("keymaps.test")
end, { desc = "Load Neotest configuration" })

-- Denops (遅延読み込み)
vim.api.nvim_create_user_command("DenopsInit", function()
	vim.opt.runtimepath:append("~/denops-getting-started")
	vim.g["denops#server#service#deno_args"] = {
		"-q",
		"--no-lock",
		"-A",
		"--unstable-ffi",
	}
	vim.g["denops_disable_version_check"] = 1
	vim.notify("Denops initialized")
end, { desc = "Initialize Denops" })
