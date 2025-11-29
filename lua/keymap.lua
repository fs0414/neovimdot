local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local vim = vim
-- fern
map('n', '<Leader>u', ':Fern %:p:h -drawer -reveal=% -width=40<CR>', opts)
-- map('n', '<c-e>', ':Fern %:p:h -reveal=s<CR>', opts)

-- window move
map('n', 'sl', '<C-w>l', opts)
map('n', 'sh', '<C-w>h', opts)
map('n', 'sj', '<C-w>j', opts)
map('n', 'sk', '<C-w>k', opts)

-- rename
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

-- term mode change
map('t', '<A-Esc>', '<C-\\><C-n>', opts)

-- split and goto definition
function SplitAndGotoDefinition(split_cmd)
  vim.cmd(split_cmd)
  vim.lsp.buf.definition()
end
map('n', '<C-h>gd', '<cmd>lua SplitAndGotoDefinition("leftabove vsplit")<CR>', opts)
map('n', '<C-j>gd', '<cmd>lua SplitAndGotoDefinition("belowright split")<CR>', opts)
map('n', '<C-k>gd', '<cmd>lua SplitAndGotoDefinition("aboveleft split")<CR>', opts)
map('n', '<C-l>gd', '<cmd>lua SplitAndGotoDefinition("rightbelow vsplit")<CR>', opts)

-- reload
map('n', '<leader>s', ':source %<CR>', opts)

-- diagnostic none
map('n', '<leader>n', '<cmd>lua vim.diagnostic.config{virtual_text=false}<CR>', opts)
--
vim.api.nvim_set_keymap('n', '<Leader>try', [[:normal! Vito try {\r} catch (err) {\r    console.error(err);\r}<Esc>]], { noremap = true, silent = true })

map('n', '<C-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-k>', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>e', '<Cmd>BufferClose<CR>', opts)

vim.api.nvim_create_user_command('Sed', function(opt)
  local args = opt.args
  local words = vim.split(args, ' ')
  if #words >= 2 then
    local old = words[1]
    local new = words[2]
    vim.cmd(string.format('%%s/%s/%s/g', old, new))
  end
end, {
nargs = '*',
complete = 'file'
})

local function get_range_str(opts)
  if opts.range ~= 2 then
    return ''
  end
  if opts.line1 == opts.line2 then
    return '#L' .. opts.line1
  end
  return '#L' .. opts.line1 .. '-L' .. opts.line2
end

local function copy_path(opts, target)
  local expr = '%'
  if target == 'full path' then
    expr = '%:p'
  elseif target == 'file name' then
    expr = '%:t'
  elseif target == 'relative path' then
    -- Get path relative to the directory where nvim was started
    local current_file = vim.fn.expand('%:p')
    local nvim_start_dir = vim.fn.getcwd()
    local relative_path = vim.fn.fnamemodify(current_file, ':s?' .. vim.fn.escape(nvim_start_dir, '\\') .. '/??')
    local path = relative_path .. get_range_str(opts)
    vim.fn.setreg('*', path)
    vim.notify('Copied ' .. target .. ': ' .. path)
    return
  end

  local path = vim.fn.expand(expr) .. get_range_str(opts)
  vim.fn.setreg('*', path)
  vim.notify('Copied ' .. target .. ': ' .. path)
end

vim.api.nvim_create_user_command('Cfp', function(opts)
  copy_path(opts, 'full path')
end, { range = true, desc = 'Copy the full path of the current file to the clipboard' })

vim.api.nvim_create_user_command('Crp', function(opts)
  copy_path(opts, 'relative path')
end, { range = true, desc = 'Copy the relative path of the current file to the clipboard' })

vim.api.nvim_create_user_command('Cfn', function(opts)
  copy_path(opts, 'file name')
end, { range = true, desc = 'Copy the file name of the current file to the clipboard' })

vim.api.nvim_create_user_command('Nonts', function()
  vim.lsp.stop_client(vim.lsp.get_clients({name = "ts_ls"}))
end, { desc = 'Stop TypeScript LSP server' })

vim.api.nvim_create_user_command('Nondeno', function()
  vim.lsp.stop_client(vim.lsp.get_clients({name = "denols"}))
end, { desc = 'Stop Deno LSP server' })
vim.api.nvim_create_user_command('Ghcd', function()
  vim.cmd('Copilot disable')
  vim.notify('Copilot disabled')
end, { desc = 'Disable GitHub Copilot' })

vim.api.nvim_create_user_command('Ghcn', function()
  vim.cmd('Copilot enable')
  vim.notify('Copilot enabled')
end, { desc = 'Enable GitHub Copilot' })

vim.api.nvim_create_user_command('CopilotToggle', function()
  local copilot_status = vim.fn['copilot#Enabled']()
  if copilot_status == 1 then
    vim.cmd('Copilot disable')
    vim.notify('Copilot disabled')
  else
    vim.cmd('Copilot enable')
    vim.notify('Copilot enabled')
  end
end, { desc = 'Toggle GitHub Copilot' })
