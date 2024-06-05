local custom_theme = require'lualine.themes.iceberg_dark'

vim.opt.laststatus = 3

local function get_relative_dirname()
  local filepath = vim.fn.expand('%:p')
  local root = vim.fn.getcwd()
  local relative_path = filepath:sub(#root + 2)
  local dirname = vim.fn.fnamemodify(relative_path, ':h')
  if dirname == '.' then
    dirname = ''
  else
    dirname = dirname .. '/'
  end
  return dirname
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_theme,
    globalstatus = true,
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b =  {get_relative_dirname, 'filename'},
    lualine_c = {'branch', 'diff'},
    lualine_x = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = '[]', warn = '[]', info = '[]',
        hint = '[]' } },
      --'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {},
  inactive_winbar = {},
  tabline = {},
  extensions = { 'fugitive' }
}
