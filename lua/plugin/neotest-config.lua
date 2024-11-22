require("neotest").setup({
  adapters = {
    require("neotest-vitest") {
      filter_dir = function(name, rel_path, root)
        return name ~= "node_modules"
      end,
    }
  }

})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>tt', function()
  require("neotest").run.run()
end, {desc = "Run nearest test"})
