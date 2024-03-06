vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.helplang = "ja"
vim.opt.hidden = true

vim.opt.clipboard:append({ "unnamedplus" })

vim.opt.wildmenu = true
vim.opt.laststatus = 2

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime = 1

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.wrap = false
vim.opt.showmatch = true

vim.opt.signcolumn = "yes"

vim.g.yoinkAutoFormat = 1
vim.g.yoinkIncludeDeleteOperations = 1
vim.g.yoinkMaxItems = 10

vim.cmd("highlight TabLineSel guibg=red guifg=white")
vim.cmd("highlight TabLine guibg=grey guifg=white")

vim.opt.ambiwidth = "single"
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.termguicolors=true

vim.cmd[[ colorscheme solarized ]]

vim.cmd[[ hi Normal guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi NormalNC guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi LineNr guibg=NONE ctermbg=NONE ]]
vim.cmd[[ hi CursorLineNr guibg=NONE ctermbg=NONE ]]

vim.cmd [[
  au InsertEnter * set cul
  au InsertLeave * set nocul
]]
