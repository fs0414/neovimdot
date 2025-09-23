local vim = vim
--n ファイルのエンコーディングをUTF-8に設定
vim.opt.fileencoding = "utf-8"
-- スワップファイルを使用しない
vim.opt.swapfile = false
-- ヘルプ言語を日本語に設定
vim.opt.helplang = "ja"
-- 非アクティブなバッファもバックグラウンドで開いておく
vim.opt.hidden = true
-- eob非表示
vim.opt.fillchars = { eob = " " }
-- マウス有効化
vim.o.mouse = "a"
-- leader key
vim.g.mapleader = " "
-- クリップボードをunnamedplusに設定してシステムのクリップボードと連携
vim.opt.clipboard:append({ "unnamedplus" })
-- コマンドラインの補完機能を有効にする
vim.opt.wildmenu = true
-- ステータスラインを常に表示
vim.opt.laststatus = 2
-- statuslineを下に固定
vim.opt.laststatus = 3
-- 検索時にハイライト表示、インクリメンタル検索を有効にする
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- マッチした検索項目を強調表示する時間を設定
vim.opt.matchtime = 1
-- telescopeの選択項目のハイライト色を設定
vim.cmd [[
  highlight TelescopeSelection guibg=#cccccc
]]

vim.keymap.set("n", "<CR>", "<C-w>w")
-- インデントに関する設定：スペース4つ分を使用
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- タブをスペースに展開
vim.opt.expandtab = true
-- 自動インデントを有効にする
vim.opt.autoindent = true
-- スマートインデントを有効にする
vim.opt.smartindent = true
-- 行番号の表示、折り返しを無効にする、マッチした括弧を表示
vim.opt.number = true
vim.opt.wrap = false
vim.opt.showmatch = true
-- 行番号を相対表示にする
vim.opt.relativenumber = true
-- 現在行は絶対行番号で表示
vim.opt.number = true
-- アンハイライト
vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>', { noremap = true, silent = true, desc = 'Clear search highlight' })
-- 文字の太さ
vim.opt.guifont = "Fira Code:h1:b"
-- サインカラムを常に表示
vim.opt.signcolumn = "yes"
-- yoinkプラグインの設定
vim.g.yoinkAutoFormat = 1
-- vim.g.yoinkIncludeDeleteOperations = 1
vim.g.yoinkMaxItems = 10
-- アンビグ幅をsingleに設定
vim.opt.ambiwidth = "single"
-- 透過度
vim.opt.winblend = 0
vim.opt.pumblend = 0
-- GUIカラーを使用
vim.opt.termguicolors = true
vim.opt.background = 'dark'
-- colorscheme with safe loading
local colorscheme = "orbital"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  -- fallback to default colorscheme
  vim.cmd[[ colorscheme default ]]
end

-- ノーマルモードのバッファ背景を透明に設定
vim.cmd[[ hi Normal guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi NormalNC guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi LineNr guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi CursorLineNr guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi CursorLine guibg=NONE ctermbg=NONE ]]

-- 挿入モード時はカーソル行をハイライト、通常モード時はハイライトを解除
vim.cmd [[
  au InsertEnter * set cul
  au InsertLeave * set nocul
]]
-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--     custom_captures = {
--       -- Highlight groups for nvim-treesitter
--       ["keyword"] = "Keyword",
--       ["function"] = "Function",
--       ["variable"] = "Variable",
--       ["string"] = "String",
--       ["type"] = "Type",
--       ["constant"] = "Constant",
--       ["identifier"] = "Identifier",
--       ["statement"] = "Statement",
--       ["special"] = "Special",
--       ["directory"] = "Directory",
--       ["character"] = "Character",
--       ["symbol"] = "Symbol",
--     },
--   },
-- }

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "+",
--   callback = function()
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = false })
vim.api.nvim_set_hl(0, 'Normal', { fg = '#EEFFFF', bold = false })
vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = false })
vim.api.nvim_set_hl(0, 'Keyword', { fg = '#33CCFF', bold = false })
vim.api.nvim_set_hl(0, 'Function', { fg = '#46EEFF', bold = false })
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#3399FF', bold = false, undercurl = false})
vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099FF', bold = false, undercurl = false})
vim.api.nvim_set_hl(0, 'String', { fg = '#EEFFFF', bold = false })
vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = false, undercurl = false})
vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = false })
vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = false })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
vim.api.nvim_set_hl(0, 'Character', { fg = '#FF3333', undercurl = false })
vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099CC', bold = false, undercurl = false })
vim.api.nvim_set_hl(0, 'Variable', { fg = '#33CCCC', bold = false, undercurl = false })
vim.api.nvim_set_hl(0, 'Constant', { fg = '#339999', bold = false, undercurl = false })
vim.api.nvim_set_hl(0, 'Number', { fg = '#339999', bold = false, undercurl = false })
vim.api.nvim_set_hl(0, 'Boolean', { fg = '#339999', bold = false, undercurl = false })
-- vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'BufferInactive', { bg = 'none' })
--   end,
-- })

--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go, typescript, lua, ruby, go, prisma, graphql",
--   callback = function()
--     vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
--     vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = false })
--     vim.api.nvim_set_hl(0, 'Normal', { fg = '#EEFFFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = false })
--     vim.api.nvim_set_hl(0, 'Keyword', { fg = '#33CCFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Function', { fg = '#46EEFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Identifier', { fg = '#3399FF', bold = false, undercurl = false})
--     vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099FF', bold = false, undercurl = false})
--     vim.api.nvim_set_hl(0, 'String', { fg = '#EEFFFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = false, undercurl = false})
--     vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = false })
--     vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = false })
--     vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
--     vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
--     vim.api.nvim_set_hl(0, 'Character', { fg = '#FF3333', undercurl = false })
--     vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099CC', bold = false, undercurl = false })
--     vim.api.nvim_set_hl(0, 'Variable', { fg = '#008080', bold = false, undercurl = false })
--     vim.api.nvim_set_hl(0, 'Constant', { fg = '#339999', bold = false, undercurl = false })
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go, typescript, lua, ruby, go, prisma, graphql",
--   print("タイプスクリプトと02"),
--   callback = function()
--     vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
--     vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = false })
--     vim.api.nvim_set_hl(0, 'Normal', { fg = '#EEFFFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = false })
--     vim.api.nvim_set_hl(0, 'Keyword', { fg = '#66CCFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Function', { fg = '#46EEFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Identifier', { fg = '#0099FF', bold = false, undercurl = false})
--     vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099FF', bold = false, undercurl = false})
--     vim.api.nvim_set_hl(0, 'String', { fg = '#EEFFFF', bold = false })
--     vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = false, undercurl = false})
--     vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = false })
--     vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = false })
--     vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
--     vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
--     vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
--     vim.api.nvim_set_hl(0, 'Character', { fg = '#FF3333', undercurl = false })
--     vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099CC', bold = false, undercurl = false })
--     vim.api.nvim_set_hl(0, 'Variable', { fg = '#008080', bold = false, undercurl = false })
--     vim.api.nvim_set_hl(0, 'Constant', { fg = '#339999', bold = false, undercurl = false })
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "graphql",
  callback = function()
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = false })
    vim.api.nvim_set_hl(0, 'Normal', { fg = '#EEFFFF', bold = false })
    vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = false })
    vim.api.nvim_set_hl(0, 'Keyword', { fg = '#66CCFF', bold = false })
    vim.api.nvim_set_hl(0, 'Function', { fg = '#46EEFF', bold = false })
    vim.api.nvim_set_hl(0, 'Identifier', { fg = '#0099FF', bold = false, undercurl = false})
    vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099FF', bold = false, undercurl = false})
    vim.api.nvim_set_hl(0, 'String', { fg = '#EEFFFF', bold = false })
    vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = false, undercurl = false})
    vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = false })
    vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = false })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
    vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
    vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
    vim.api.nvim_set_hl(0, 'Character', { fg = '#FF3333', undercurl = false })
    vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099CC', bold = false, undercurl = false })
    vim.api.nvim_set_hl(0, 'Variable', { fg = '#008080', bold = false, undercurl = false })
    vim.api.nvim_set_hl(0, 'Constant', { fg = '#339999', bold = false, undercurl = false })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "prisma",
  callback = function()
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = false })
    vim.api.nvim_set_hl(0, 'Normal', { fg = '#EEFFFF', bold = false })
    vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = false })
    vim.api.nvim_set_hl(0, 'Keyword', { fg = '#66CCFF', bold = false })
    vim.api.nvim_set_hl(0, 'Function', { fg = '#46EEFF', bold = false })
    vim.api.nvim_set_hl(0, 'Identifier', { fg = '#0099FF', bold = false, undercurl = false})
    vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099FF', bold = false, undercurl = false})
    vim.api.nvim_set_hl(0, 'String', { fg = '#EEFFFF', bold = false })
    vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = false, undercurl = false})
    vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = false })
    vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = false })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
    vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
    vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = false })
    vim.api.nvim_set_hl(0, 'Character', { fg = '#FF3333', undercurl = false })
    vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099CC', bold = false, undercurl = false })
    vim.api.nvim_set_hl(0, 'Variable', { fg = '#008080', bold = false, undercurl = false })
    vim.api.nvim_set_hl(0, 'Constant', { fg = '#339999', bold = false, undercurl = false })
  end,
})

-- :TSEnable highlight

 -- require("bufferline").setup{}
