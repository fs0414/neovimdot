-- Hover設定

-- Hover専用namespace
local hover_ns = vim.api.nvim_create_namespace("lsp_hover_highlight")

-- vim.lsp.util.open_floating_previewをラップしてwinhighlightを適用
local original_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
	local buf, win = original_open_floating_preview(contents, syntax, opts, ...)
	if win and buf then
		vim.wo[win].winhighlight = "Normal:LspHoverNormal,FloatBorder:LspHoverBorder"

		-- バッファ全体に白色のextmarkを適用（最高優先度）
		local line_count = vim.api.nvim_buf_line_count(buf)
		for i = 0, line_count - 1 do
			local line = vim.api.nvim_buf_get_lines(buf, i, i + 1, false)[1] or ""
			if #line > 0 then
				vim.api.nvim_buf_set_extmark(buf, hover_ns, i, 0, {
					end_col = #line,
					hl_group = "LspHoverNormal",
					priority = 10000,
				})
			end
		end
	end
	return buf, win
end
