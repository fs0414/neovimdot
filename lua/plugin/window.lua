vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    local buf = vim.api.nvim_create_buf(false, true)
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    local win = vim.api.(buf, true, {
      relative = "editor",
      width = width - 4,
      height = height - 4,
      col = 2,
      row = 2,
      style = "minimal",
      border = "rounded",
      winblend = 1
    })

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "これはフローティングウィンドウです", "winblendを使用して透過度を調整" })
  end
})
