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

function combined_search()
    local input = vim.fn.input("Search: ")
    local words = {}
    for word in input:gmatch("%S+") do
        table.insert(words, word)
    end
    local args = {}
    for _, word in ipairs(words) do
        table.insert(args, "-e")
        table.insert(args, word)
    end

    require("telescope.builtin").live_grep({
        default_text = input,
        additional_args = function()
            return args
        end,
    })
end

vim.api.nvim_set_keymap('n', '<c-h>', '<cmd>lua combined_search()<cr>', { noremap = true, silent = true })

require('telescope').load_extension('fzf')
vim.cmd[[highlight TelescopeSelection guifg=#ffffff guibg=#5f5f5f ctermfg=white ctermbg=darkgrey]]
