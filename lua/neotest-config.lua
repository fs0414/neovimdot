require("neotest").setup({
  adapters = {
        require("neotest-vitest") {
          -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
        },
      }
  })

local map = vim.keymap.set

map('n', '<leader>tt', function()
  require("neotest").run.run()
end, {desc = "Run nearest test"})
map("n", "<leader> tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)

map(
    "n",
    "<leader>twr",
    "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
    {desc = "Run Watch"}
)
