-- Autocmd設定

-- 挿入モード時はカーソル行をハイライト、通常モード時はハイライトを解除
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.cursorline = true
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.cursorline = false
	end,
})
