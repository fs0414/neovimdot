-- LSP関連キーマップ
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- rename
map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- diagnostic
map("n", "<leader>n", "<cmd>lua vim.diagnostic.config{virtual_text=false}<CR>", opts)

-- split and goto definition
function SplitAndGotoDefinition(split_cmd)
	vim.cmd(split_cmd)
	vim.lsp.buf.definition()
end

map("n", "<C-h>gd", '<cmd>lua SplitAndGotoDefinition("leftabove vsplit")<CR>', opts)
map("n", "<C-k>gd", '<cmd>lua SplitAndGotoDefinition("aboveleft split")<CR>', opts)
map("n", "<C-l>gd", '<cmd>lua SplitAndGotoDefinition("rightbelow vsplit")<CR>', opts)

-- LspAttach時のキーマップ
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buf_opts = { buffer = args.buf }
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, buf_opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, buf_opts)
		vim.keymap.set("n", "<C-k>", function()
			vim.lsp.buf.signature_help({ border = "rounded" })
		end, buf_opts)
		vim.keymap.set("n", "<leader>dd", function()
			vim.diagnostic.open_float({ border = "rounded" })
		end, buf_opts)
	end,
})
