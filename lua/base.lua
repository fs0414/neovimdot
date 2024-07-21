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

-- 文字の太さ
vim.opt.guifont = "Fira Code:h1:b"

-- サインカラムを常に表示
vim.opt.signcolumn = "yes"

-- yoinkプラグインの設定
vim.g.yoinkAutoFormat = 1
-- vim.g.yoinkIncludeDeleteOperations = 1
vim.g.yoinkMaxItems = 10

-- アンビグ幅をsingleに設定
-- 透過度
vim.opt.ambiwidth = "single"
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- GUIカラーを使用
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- カラースキームをsolarizedに設定
--vim.cmd[[ colorscheme solarized ]]
vim.cmd[[ colorscheme tokyonight ]]
--vim.cmd[[ colorscheme vim-winteriscoming ]]

--vim.cmd[[ colorscheme orbital ]]


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

-- ハイライトリンクの設定
--vim.cmd([[
--  highlight! link Keyword KeywordColor
--  highlight! link Function FunctionColor
--  highlight! link Identifier IdentifierColor
--  highlight! link String StringColor
--  highlight! link DiagnosticUnderlineError DiagnosticUnderlineErrorColor
--  highlight! link Directory DirectoryColor
--  highlight! link Special SpecialColor
--  highlight! link Symbol SymbolColor
--  highlight! link Number NumberColor
--  highlight! link Character CharacterColor
--  highlight! link Variable VariableColor
--  highlight! link Constant ConstantColor
--
--  highlight! link Statement StatementColor
--  highlight! link Conditional ConditionalColor
--  highlight! link Repeat RepeatColor
--  highlight! link Type TypeColor
--  highlight! link Operator OperatorColor
--
--  highlight! link TSConstant TSConstantColor
--  highlight! link TSVariable TSVariableColor
--  
--  
--]])

--require'nvim-treesitter.configs'.setup {
--  ensure_installed = "all", -- 全ての利用可能な言語パーサーをインストール
--  highlight = {
--    enable = false,              -- Treesitterによるシンタックスハイライトを有効化
--    additional_vim_regex_highlighting = false,
--  },
--  indent = {
--    enable = true,              -- Treesitterによる自動インデントを有効化
--  },
--}

vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = false })

vim.api.nvim_set_hl(0, 'Normal', { fg = '#EEFFFF', bold = false })
vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = false })
vim.api.nvim_set_hl(0, 'Keyword', { fg = '#66CCFF', bold = false })
vim.api.nvim_set_hl(0, 'Function', { fg = '#46EEFF', bold = false })
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#0099FF', bold = false, undercurl = false})
vim.api.nvim_set_hl(0, 'Statement', { fg = '#0099FF', bold = false, undercurl = false})
--
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
--
--vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#FF0000', bold = true, undercurl = false })
--vim.api.nvim_set_hl(0, 'TSVariable', { fg = '#FF0000', bold = true, undercurl = false })
--vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = '#FF0000', bold = true, undercurl = false })

--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "lua",
--  callback = function()
--    vim.api.nvim_set_hl(0, 'Normal', { fg = '#DDFFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'KeywordColor', { fg = '#66CCFF', bold = true })
--    vim.api.nvim_set_hl(0, 'FunctionColor', { fg = '#46EEFF', bold = true })
--    vim.api.nvim_set_hl(0, 'IdentifierColor', { fg = '#0099FF', bold = true })
--    vim.api.nvim_set_hl(0, 'String', { fg = '#EEEEEE', bold = true })
--    vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Symbol', { sp = '#FF3333', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Character', { sp = '#FF3333', undercurl = true })
--    --
--    vim.api.nvim_set_hl(0, 'Statement', { sp = '#FF0000', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Variable', { sp = '#FF0000', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Constant', { sp = '#FF0000', undercurl = true })
--  end,
--})
--
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "typescript",
--  callback = function()
--    vim.api.nvim_set_hl(0, 'Normal', { fg = '#DDFFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'KeywordColor', { fg = '#66CCFF', bold = true })
--    vim.api.nvim_set_hl(0, 'FunctionColor', { fg = '#46EEFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Identifier', { fg = '#339999', bold = true, undercurl = false })
--    vim.api.nvim_set_hl(0, 'String', { fg = '#EEEEEE', bold = true })
--    vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Symbol', { sp = '#FF3333', bold = true, undercurl = false})
--    vim.api.nvim_set_hl(0, 'Character', { sp = '#FF3333', bold = true, undercurl = false })
--    --
--    vim.api.nvim_set_hl(0, 'Statement', { fg = '#CC99FF', bold = true, undercurl = false })
--    vim.api.nvim_set_hl(0, 'Operator', { fg = '#CC99FF', bold = true, undercurl = false })
--
--    vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#EE0000', bold = true, undercurl = false })
--    vim.api.nvim_set_hl(0, 'TSVariable', { fg = '#EE0000', bold = true, undercurl = false })
--
--    -- TSConstant
--    --vim.api.nvim_set_hl(0, 'Variable', { fg = '#00FF00', bold = true, undercurl = false })
--    --vim.api.nvim_set_hl(0, 'Constant', { fg = '#00FF00', bold = true, undercurl = false })
--  end,
--})
--
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "go",
--  callback = function()
--    vim.api.nvim_set_hl(0, 'Normal', { fg = '#DDFFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'KeywordColor', { fg = '#33CCCC', bold = true })
--    vim.api.nvim_set_hl(0, 'FunctionColor', { fg = '#46EEFF', bold = true })
--    vim.api.nvim_set_hl(0, 'IdentifierColor', { fg = '#0099FF', bold = true })
--    vim.api.nvim_set_hl(0, 'String', { fg = '#99FFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Type', { fg = '#CC99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Symbol', { fg = '#FF3333', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Character', { fg = '#FF3333', undercurl = true })
--  end,
--})

--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "php",
--  callback = function()
--    vim.api.nvim_set_hl(0, 'Normal', { fg = '#DDFFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = true })
--    vim.api.nvim_set_hl(0, 'Keyword', { fg = '#FF0033', bold = true })
--    vim.api.nvim_set_hl(0, 'Function', { fg = '#46EEFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Identifier', { fg = '#00CCFF', bold = true })
--    vim.api.nvim_set_hl(0, 'String', { fg = '#EEEEEE', bold = true })
--    vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = true })
--    vim.api.nvim_set_hl(0, 'Special', { fg = '#3366FF', bold = true })
--    vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = true })
--    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Symbol', { sp = '#FF3333', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Character', { sp = '#FF3333', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Variable', { sp = '#FF3333', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Constant', { sp = '#3366FF', undercurl = true })
--
--    vim.api.nvim_set_hl(0, 'Statement', { sp = '#00FFFF', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Conditional', { sp = '#00FFFF', undercurl = true })
--    vim.api.nvim_set_hl(0, 'Repeat', { sp = '#00FFFF', undercurl = true })
--  end,
--})
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal', { fg = '#DDFFFF', bold = true })
    vim.api.nvim_set_hl(0, 'Search', { fg = '#FF99FF', bold = true })
    vim.api.nvim_set_hl(0, 'KeywordColor', { fg = '#FF0033', bold = true })
    vim.api.nvim_set_hl(0, 'FunctionColor', { fg = '#46EEFF', bold = true })
    vim.api.nvim_set_hl(0, 'IdentifierColor', { fg = '#0099FF', bold = true })
    vim.api.nvim_set_hl(0, 'String', { fg = '#EEEEEE', bold = true })
    vim.api.nvim_set_hl(0, 'Type', { fg = '#33CCFF', bold = true })
    vim.api.nvim_set_hl(0, 'Special', { fg = '#CC99FF', bold = true })
    vim.api.nvim_set_hl(0, 'Directory', { fg = '#11FFFF', bold = true })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#FFFAFA', undercurl = true })
    vim.api.nvim_set_hl(0, 'Symbol', { sp = '#FF3333', undercurl = true })
    vim.api.nvim_set_hl(0, 'Character', { sp = '#FF3333', undercurl = true })
    vim.api.nvim_set_hl(0, 'Variable', { sp = '#FF3333', undercurl = true })
    vim.api.nvim_set_hl(0, 'Constant', { sp = '#FF3333', undercurl = true })
  end,
})
--


