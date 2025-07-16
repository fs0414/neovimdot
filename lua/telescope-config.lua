require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "^.git/",
            "^.cache/",
            "^Library/",
            "Parallels",
            "^Movies",
            "^Music",
            "node_modules/",
            "dist/",
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-uu",
        },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    },
    pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
    }
  },
})

require('telescope').load_extension('fzf')
vim.cmd[[highlight TelescopeSelection guifg=#ffffff guibg=#5f5f5f ctermfg=white ctermbg=darkgrey]]
