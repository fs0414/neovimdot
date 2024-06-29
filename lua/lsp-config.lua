local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local cmp = require('cmp')
local luasnip = require('luasnip')
require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

--local on_attach = function(bufnr)
--  vim.api.nvim_buf_create_user_command(
--    bufnr, 'Format', function(_)
--      vim.lsp.buf.format()
--    end,
--    {
--      desc = 'Format current buffer with LSP'
--    }
--  )
--end

local custom_on_publish_diagnostics = function(_, result, ctx, config)
  local filtered_diagnostics = {}
  for _, diagnostic in ipairs(result.diagnostics) do
    if diagnostic.severity ~= vim.diagnostic.severity.INFO and diagnostic.severity ~= vim.diagnostic.severity.WARN then
       table.insert(filtered_diagnostics, diagnostic)
    end
  end
  result.diagnostics = filtered_diagnostics
  vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

require('mason').setup {
 ui = {
   check_outdated_packages_on_open = false,
   border = 'single',
 },
}

vim.diagnostic.config({
  virtual_text = false,  -- 仮想テキストを非表示
  signs = true,          -- サインカラムのアイコンを表示
  underline = true,      -- 問題のあるテキストを下線で表示
  update_in_insert = false,  -- 挿入モードで更新しない
  severity_sort = true,  -- 重要度順にソート
  float = {              -- フローティングウィンドウの設定
    show_header = false,   -- ヘッダーを非表示
    source = 'cursor',     -- ソース(どのLSPからの診断か)を表示
    border = 'rounded',    -- ボーダーを丸くする
    focusable = true,      -- フォーカス可能にする
  },
})

function ShowDiagnostics()
  local opts = {
    focusable = true,
    close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"},
    border = 'single',
    source = 'current',  -- 診断のソースも表示
    prefix = ' ',
    scope = 'cursor',  -- カーソル位置の診断のみを表示
  }
  vim.diagnostic.open_float(nil, opts)
end

function PrintDiagnosticConfig()
    local config = vim.diagnostic.config()
    print(vim.inspect(config))
end

vim.api.nvim_set_keymap('n', '<c-m>', '<cmd>lua ShowDiagnostics()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua PrintDiagnosticConfig()<CR>', { noremap = true, silent = true })

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup{
      capabilities = capabilities,
      --on_attach = on_attach,
      handlers = {
        ["textDocument/publishDiagnostics"] = custom_on_publish_diagnostics,
       },
    }
  end
})


-- cmp
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered({
        order = 'single'
      }),
      documentation = cmp.config.window.bordered({
        border = 'single'
      }),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    },
    ---

    ---sources = cmp.config.sources({
    ---  { name = 'path' }
    ---}, {
    ---  { name = 'cmdline' }
    ---})
})


