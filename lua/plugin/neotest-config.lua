require("neotest").setup({
  adapters = {
    require("neotest-vitest") {
      filter_dir = function(name)
        return name ~= "node_modules"
      end,
    }
  }
})

local map = vim.keymap.set

map('n', '<leader>tt', function()
  require("neotest").run.run()
end, {desc = "Run nearest test"})
map("n", "<leader> tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)

