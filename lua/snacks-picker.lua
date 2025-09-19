local picker = require("snacks.picker")
local vim = vim

-- Configure picker UI with cyan colors and full file paths
-- picker.setup({
--   -- File path display configuration
--   formatters = {
--     file = {
--       filename_first = false,  -- Display full path before filename
--       truncate = false,        -- Don't truncate paths - show full path
--       filename_only = false,   -- Show full path, not just filename
--     }
--   },
-- })

-- Set highlight groups - directories white, matches cyan
vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "White" })
vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = "White" })
vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = "Cyan", bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerSelection", { bg = "#3a3a3a", fg = "White" })
vim.api.nvim_set_hl(0, "SnacksPickerSpecial", { fg = "White" })
vim.api.nvim_set_hl(0, "SnacksPickerVirtText", { fg = "Cyan" })

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-p>", '<cmd>lua require("snacks.picker").files()<CR>', opts)
map("n", "<C-g>", '<cmd>lua require("snacks.picker").grep()<CR>', opts)
map("n", "<C-f>", '<cmd>lua require("snacks.picker").lines()<CR>', opts)
map("n", "<C-b>", '<cmd>lua require("snacks.picker").buffers()<CR>', opts)
map("n", "<C-l>", '<cmd>lua require("snacks.picker").recent()<CR>', opts)
map("n", "<C-r>", '<cmd>lua require("snacks.picker").lsp_references()<CR>', opts)
map("n", "gd", '<cmd>lua require("snacks.picker").lsp_definitions()<CR>', opts)
map("n", "<C-c>", '<cmd>lua require("snacks.picker").lsp_declarations()<CR>', opts)
-- map('n', '<C-i>', '<cmd>lua require("snacks.picker").lsp_implementations()<CR>', opts)
map("n", "<C->", '<cmd>lua require("snacks.picker").lsp_document_symbols()<CR>', opts)
--map("n", "<C-t>", '<cmd>lua require("snacks.picker").lsp_typedefs()<CR>', opts)
--map("n", "<C-l>", '<cmd>lua require("snacks.picker").diagnostics_document()<CR>', opts)
