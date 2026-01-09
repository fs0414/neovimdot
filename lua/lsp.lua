-- LSP設定 (Neovim 0.11+ 組み込み機能を使用)

-- masonのbinディレクトリをPATHに追加
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH

-- Capabilities (blink.cmp連携)
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- グローバル設定
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- 有効化するサーバー一覧
vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'denols',
  'biome',
  'rust_analyzer',
  'ruby_lsp',
  'gopls',
})

-- LSP情報表示コマンド
vim.api.nvim_create_user_command('LspInfo', function()
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    print('No LSP clients attached')
    return
  end
  for _, c in ipairs(clients) do
    print(string.format('%s: %s', c.name, c.root_dir or 'N/A'))
  end
end, { desc = 'Show attached LSP clients' })

-- Diagnostic設定
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
    format = function(diagnostic)
      local message = diagnostic.message
      local code = diagnostic.code or ''
      local source = diagnostic.source or ''

      -- biomeのルールにドキュメントURLを追加
      if source == 'biome' and type(code) == 'string' and code:match('/') then
        local url = 'https://biomejs.dev/linter/rules/' .. code:match('[^/]+$'):gsub('(%u)', function(c) return '-' .. c:lower() end):gsub('^-', '')
        return string.format('%s [%s]\n📖 %s', message, code, url)
      end

      -- TypeScriptエラーコードにドキュメントURLを追加
      if (source == 'typescript' or source == 'ts') and code then
        local url = 'https://typescript.tv/errors/#ts' .. code
        return string.format('%s [TS%s]\n📖 %s', message, code, url)
      end

      if code ~= '' then
        return string.format('%s [%s]', message, code)
      end
      return message
    end,
  },
})

-- ハイライト設定（ColorScheme読み込み後に適用）
local function setup_lsp_highlights()
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#808080', bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { fg = '#e0e0e0', bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'LspHoverNormal', { fg = '#ffffff', bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'LspHoverBorder', { fg = '#808080', bg = 'NONE' })
  -- 診断の下線色（太い下線）
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = '#ff5555' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = '#ffff55' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = '#55ffff' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = '#55ff55' })
end

setup_lsp_highlights()
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = setup_lsp_highlights,
})

-- Hover専用namespace
local hover_ns = vim.api.nvim_create_namespace('lsp_hover_highlight')

-- vim.lsp.util.open_floating_previewをラップしてwinhighlightを適用
local original_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  local buf, win = original_open_floating_preview(contents, syntax, opts, ...)
  if win and buf then
    vim.wo[win].winhighlight = 'Normal:LspHoverNormal,FloatBorder:LspHoverBorder'

    -- バッファ全体に白色のextmarkを適用（最高優先度）
    local line_count = vim.api.nvim_buf_line_count(buf)
    for i = 0, line_count - 1 do
      local line = vim.api.nvim_buf_get_lines(buf, i, i + 1, false)[1] or ''
      if #line > 0 then
        vim.api.nvim_buf_set_extmark(buf, hover_ns, i, 0, {
          end_col = #line,
          hl_group = 'LspHoverNormal',
          priority = 10000, -- 最高優先度
        })
      end
    end
  end
  return buf, win
end

-- LspAttach時のキーマップ
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    -- Neovim 0.11+: hoverにオプションを渡してフローティングウィンドウで表示
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover({ border = 'rounded' })
    end, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<C-k>', function()
      vim.lsp.buf.signature_help({ border = 'rounded' })
    end, opts)
    -- 診断をフローティングウィンドウで表示
    vim.keymap.set('n', '<C-m>', function()
      vim.diagnostic.open_float({ border = 'rounded' })
    end, opts)
  end,
})
