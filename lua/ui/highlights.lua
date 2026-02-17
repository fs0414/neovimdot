local M = {}

-- グローバルハイライト設定
local function setup_global_highlights()
	-- 基本UI
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777", bg = "NONE", bold = false })
	vim.api.nvim_set_hl(0, "Normal", { fg = "#EEFFFF", bold = false })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })

	-- 検索
	vim.api.nvim_set_hl(0, "Search", { fg = "#FF99FF", bold = false })

	-- シンタックス
	vim.api.nvim_set_hl(0, "Keyword", { fg = "#33CCFF", bold = false })
	vim.api.nvim_set_hl(0, "Function", { fg = "#46EEFF", bold = false })
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#3399FF", bold = false, undercurl = false })
	vim.api.nvim_set_hl(0, "Statement", { fg = "#0099CC", bold = false, undercurl = false })
	vim.api.nvim_set_hl(0, "String", { fg = "#EEFFFF", bold = false })
	vim.api.nvim_set_hl(0, "Type", { fg = "#33CCFF", bold = false, undercurl = false })
	vim.api.nvim_set_hl(0, "Special", { fg = "#CC99FF", bold = false })
	vim.api.nvim_set_hl(0, "Directory", { fg = "#11FFFF", bold = false })
	vim.api.nvim_set_hl(0, "Symbol", { fg = "#FF3333", undercurl = false })
	vim.api.nvim_set_hl(0, "Character", { fg = "#FF3333", undercurl = false })
	vim.api.nvim_set_hl(0, "Variable", { fg = "#33CCCC", bold = false, undercurl = false })
	vim.api.nvim_set_hl(0, "Constant", { fg = "#339999", bold = false, undercurl = false })
	vim.api.nvim_set_hl(0, "Number", { fg = "#339999", bold = false, undercurl = false })
	vim.api.nvim_set_hl(0, "Boolean", { fg = "#339999", bold = false, undercurl = false })

	-- Telescope
	vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#cccccc" })
end

-- LSP関連ハイライト
local function setup_lsp_highlights()
	-- Float
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#808080", bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#e0e0e0", bg = "NONE" })
	vim.api.nvim_set_hl(0, "LspHoverNormal", { fg = "#ffffff", bg = "NONE" })
	vim.api.nvim_set_hl(0, "LspHoverBorder", { fg = "#808080", bg = "NONE" })

	-- Diagnostic
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#ff5555" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = "#ffff55" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true, sp = "#55ffff" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = true, sp = "#55ff55" })
end

-- 補完メニュー (blink.cmp) ハイライト
local function setup_completion_highlights()
	-- メニュー
	vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#808080", bg = "NONE" })
	vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#2a2a2a" })

	-- ドキュメント
	vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#ffffff", bg = "NONE" })
	vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#808080", bg = "NONE" })

	-- Kind icons
	vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = "#00ffff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = "#00ffff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = "#00ffff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { fg = "#ffaa00" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = "#00ff00" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = "#ff00ff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = "#ffaa00" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = "#ffaa00" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = "#ffaa00" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = "#00ff00" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = "#ff00ff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { fg = "#ffaa00" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = "#ff00ff" })
	vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = "#00ffff" })

	-- Pmenu (ポップアップメニュー)
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2a2a" })
	vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#808080" })
end

-- Picker (snacks.picker) ハイライト
local function setup_picker_highlights()
	vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "White" })
	vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = "White" })
	vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = "Cyan", bold = true })
	vim.api.nvim_set_hl(0, "SnacksPickerSelection", { bg = "#3a3a3a", fg = "White" })
	vim.api.nvim_set_hl(0, "SnacksPickerSpecial", { fg = "White" })
	vim.api.nvim_set_hl(0, "SnacksPickerVirtText", { fg = "Cyan" })
end

-- Diffview ハイライト（見やすい色に変更）
local function setup_diffview_highlights()
	-- 追加行（緑系）
	vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1a3a1a", fg = "NONE" })
	vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = "#1a3a1a", fg = "NONE" })
	vim.api.nvim_set_hl(0, "DiffviewDiffAddText", { bg = "#2a5a2a", fg = "NONE" })

	-- 削除行（赤系）
	vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3a1a1a", fg = "#555555" })
	vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = "#3a1a1a", fg = "#555555" })

	-- 変更行（青系）
	vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1a2a3a", fg = "NONE" })
	vim.api.nvim_set_hl(0, "DiffText", { bg = "#2a4a6a", fg = "NONE" })
	vim.api.nvim_set_hl(0, "DiffviewDiffChange", { bg = "#1a2a3a", fg = "NONE" })
	vim.api.nvim_set_hl(0, "DiffviewDiffText", { bg = "#2a4a6a", fg = "NONE" })

	-- ファイルパネル
	vim.api.nvim_set_hl(0, "DiffviewFilePanelTitle", { fg = "#66ccff", bold = true })
	vim.api.nvim_set_hl(0, "DiffviewFilePanelFileName", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "DiffviewFilePanelPath", { fg = "#888888" })
end

-- Flash ハイライト
local function setup_flash_highlights()
	vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#00FFFF", bg = "#003333", bold = true, italic = true })
	vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#88ccff", bg = "#333333" })
	vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#ffffff", bg = "#555555" })
end

-- 全ハイライトを適用
function M.setup()
	setup_global_highlights()
	setup_lsp_highlights()
	setup_completion_highlights()
	setup_picker_highlights()
	setup_diffview_highlights()
	setup_flash_highlights()
end

-- 初回適用
M.setup()

-- ColorScheme変更時に再適用
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = M.setup,
})

return M
