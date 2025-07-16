local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')
require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
local vim = vim

-- local custom_on_publish_diagnostics = function(_, result, ctx, config)
--   local filtered_diagnostics = {}
--   for _, diagnostic in ipairs(result.diagnostics) do
--     if diagnostic.severity ~= vim.diagnostic.severity.INFO and diagnostic.severity ~= vim.diagnostic.severity.WARN then
--        table.insert(filtered_diagnostics, diagnostic)
--     end
--   end
--   result.diagnostics = filtered_diagnostics
--   vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
-- end

require('mason').setup {
 ui = {
   check_outdated_packages_on_open = false,
   border = 'single',
 },
}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  focusable = true,
  float = {
    show_header = true,
    source = 'cursor',
    border = 'rounded',
    focusable = true,
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single",
    width = 70,
    height = 10,
    row = 10,
    col = 5,
    style = "minimal",
    focusable = false,
  }
)

function ShowDiagnostics()
  vim.diagnostic.open_float({
    signs = true,
    underline = true,
    update_in_insert = false,
    focusable = true,
    float = {
      show_header = true,
      source = "cursor",
      border = "rounded",
      focusable = true,
    },
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      -- "InsertCharPre",
      -- "WinLeave",
    },
  })
end

require("hover").setup {
  init = function()
      require("hover.providers.lsp")
  end,
  preview_opts = {
      border = 'single'
  },
  preview_window = true,
  title = true,
  mouse_providers = {
      'LSP'
  },
  mouse_delay = 1000
}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_lspconfig = require("mason-lspconfig")

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("my.lsp", {}),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     -- 補完の設定
--     if client:supports_method('textDocument/completion') then
--       -- 文字を入力する度に補完を表示（遅くなる可能性あり）
--       local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--       client.server_capabilities.completionProvider.triggerCharacters = chars
--       -- 補完を有効化
--       vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--     end
--     -- フォーマット
--     if not client:supports_method('textDocument/willSaveWaitUntil')
--       and client:supports_method('textDocument/formatting') then
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
--         buffer = args.buf,
--         callback = function()
--           vim.lsp.buf.format({bufnr = args.buf, id = client.id, timeout_ms = 3000})
--         end,
--       })
--     end
--   end,
-- })


-- local servers = {
--   graphql = {
--     filetypes = { "graphql" },
--   },
--   prismals = {
--     filetypes = { "prisma" },
--   },
--   -- denols = {
--   --   filetypes = { "deno" },
--   -- },
-- }

-- lspconfig.eslint.setup({
--   on_attach = function(client)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--   end,
-- })

-- vim.lsp.config("denols", {
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
--   init_options = {
--     lint = true,
--     unstable = true,
--   },
--   single_file_support = false,
-- })

-- tsserverの設定（Denoプロジェクトでは起動しない）
-- vim.lsp.config("ts_ls", {
--   capabilities = capabilities,
--   -- root_dir = lspconfig.util.root_pattern("package.json"),
--   single_file_support = false,
--   -- on_new_config = function(new_config, new_root_dir)
--   --   -- Denoプロジェクトの場合は起動をキャンセル
--   --   if lspconfig.util.path.exists(lspconfig.util.path.join(new_root_dir, "deno.json"))
--   --     or lspconfig.util.path.exists(lspconfig.util.path.join(new_root_dir, "deno.jsonc")) then
--   --     new_config.enabled = false
--   --   end
--   -- end,
-- })

-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }
-- local custom_on_publish_diagnostics = function(_, result, ctx, config)
--   local filtered_diagnostics = vim.tbl_filter(function(diagnostic)
--     return diagnostic.severity > vim.lsp.protocol.DiagnosticSeverity.Warning
--   end, result.diagnostics)
--
--   result.diagnostics = filtered_diagnostics
--
--   vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
-- end

mason_lspconfig.setup {
  -- function(server_name)
  --   require("lspconfig")[server_name].setup {
  --     capabilities = capabilities,
  --     -- on_attach = on_attach,
  --     settings = servers[server_name],
  --     filetypes = (servers[server_name] or {}).filetypes,
  --     handlers = {
  --       ["textDocument/publishDiagnostics"] = custom_on_publish_diagnostics,
  --     },
  --   };
  -- end
}

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "single"
  }
})

function PrintDiagnosticConfig()
    local config = vim.diagnostic.config()
    print(vim.inspect(config))
end

vim.api.nvim_set_keymap('n', '<c-m>', '<cmd>lua ShowDiagnostics()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua PrintDiagnosticConfig()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = vim.api.nvim_get_hl_by_name('Normal', true).background })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = vim.api.nvim_get_hl_by_name('Normal', true).background })

vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})

vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })

vim.o.mousemoveevent = true

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
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
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
})

local map = vim.api.nvim_set_keymap
-- dap-ui key map
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true})
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true})

-- dap-go key map
map("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", { silent = true })

