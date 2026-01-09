local Snacks = require("snacks")
local vim = vim
require('gitsigns').setup {}
local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    blame = "<Leader>gb",
    browse = "<Leader>go",
  }
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- lazygit
require("diffview").setup()
local neogit = require('neogit')
neogit.setup {}
require("diffview").setup()

map('n', '<leader>df', ':DiffviewOpen<CR>', opts)
map('n', '<leader>g', ':Lazygit<CR>', opts)
map('n', '<leader>gg', ':Neogit<CR>', opts)

-- NotePush: git add, commit, push execution
vim.api.nvim_create_user_command("NotePush", function()
  -- 現在のバッファのディレクトリを取得（gitリポジトリのルートを探す）
  local buf_dir = vim.fn.expand("%:p:h")
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(buf_dir) .. " rev-parse --show-toplevel")[1]

  if vim.v.shell_error ~= 0 or not git_root then
    vim.notify("Not a git repository", vim.log.levels.ERROR)
    return
  end

  Snacks.input({ prompt = "Type 'yes' to push: " }, function(value)
    if value == "yes" then
      local cmd = string.format(
        "cd %s && git add . && git commit -m 'note update' && git push",
        vim.fn.shellescape(git_root)
      )
      vim.fn.jobstart(cmd, {
        on_exit = function(_, code)
          if code == 0 then
            vim.notify("Push complete: " .. git_root, vim.log.levels.INFO)
          else
            vim.notify("Push failed (code: " .. code .. ")", vim.log.levels.ERROR)
          end
        end,
      })
    else
      vim.notify("Cancelled", vim.log.levels.WARN)
    end
  end)
end, { desc = "git add, commit, push を一括実行" })

map('n', '<leader>np', ':NotePush<CR>', opts)
