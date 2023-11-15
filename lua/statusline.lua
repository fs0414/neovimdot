local custom_theme = require'lualine.themes.iceberg_dark'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_theme,
    component_separators = { left = '[]', right = '[]'},
    section_separators = { left = '[]', right = '[]'},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    --lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = '[]', warn = '[]', info = '[]',
        hint = '[]' } },
      'encoding',
      'filetype'
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
