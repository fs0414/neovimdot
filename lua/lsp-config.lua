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

-- diagnosticsの設定は lsp-optimize.lua に移動
-- 重複を避けるためここではコメントアウト
-- vim.diagnostic.config({
--   virtual_text = false,
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
--   focusable = true,
--   float = {
--     show_header = true,
--     source = 'cursor',
--     border = 'rounded',
--     focusable = true,
--   },
-- })

-- hoverハンドラーの設定は lsp-optimize.lua に移動
-- 重複を避けるためここではコメントアウト
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover,
--   {
--     border = "single",
--     width = 70,
--     height = 10,
--     row = 10,
--     col = 5,
--     style = "minimal",
--     focusable = false,
--   }
-- )

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

-- cmp_nvim_lspのcapabilitiesを使用してLSP機能を有効化
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mason_lspconfig = require("mason-lspconfig")

-- lsp-optimizeモジュールを読み込み
local lsp_optimize = require('lsp-optimize')

-- 大規模リポジトリかチェック
local is_large_repo = lsp_optimize.is_large_repo()

-- 大規模リポジトリの場合、ワークスペース設定を追加
if is_large_repo then
  local workspace_config = lsp_optimize.get_large_repo_workspace_config()
  capabilities.workspace = vim.tbl_deep_extend("force", capabilities.workspace or {}, workspace_config)
end

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


local servers = {
  graphql = {
    filetypes = { "graphql" },
  },
  prismals = {
    filetypes = { "prisma" },
  },
  -- denols = {
  --   filetypes = { "deno" },
  -- },
}

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
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  -- root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false,
  -- on_new_config = function(new_config, new_root_dir)
  --   -- Denoプロジェクトの場合は起動をキャンセル
  --   if lspconfig.util.path.exists(lspconfig.util.path.join(new_root_dir, "deno.json"))
  --     or lspconfig.util.path.exists(lspconfig.util.path.join(new_root_dir, "deno.jsonc")) then
  --     new_config.enabled = false
  --   end
  -- end,
})

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = false, -- 自動インストールを無効化して起動速度向上
  handlers = {
    -- デフォルトハンドラー
    function(server_name)
      local custom_on_publish_diagnostics = function(_, result, ctx, config)
        local filtered_diagnostics = vim.tbl_filter(function(diagnostic)
          return diagnostic.severity > vim.lsp.protocol.DiagnosticSeverity.Warning
        end, result.diagnostics)

        result.diagnostics = filtered_diagnostics

        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
      end
      
      -- 基本設定を取得
      local server_config = {
        capabilities = capabilities,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
        handlers = {
          ["textDocument/publishDiagnostics"] = custom_on_publish_diagnostics,
        },
      }
      
      -- LSP最適化設定を追加
      local optimized_config = lsp_optimize.get_optimized_client_config(is_large_repo)
      server_config = vim.tbl_deep_extend("force", server_config, optimized_config)
      
      -- TypeScript/JavaScript系のサーバーには追加の最適化
      if server_name == "ts_ls" or server_name == "denols" then
        local ts_settings = lsp_optimize.get_ts_optimized_settings()
        server_config.settings = vim.tbl_deep_extend("force", server_config.settings or {}, ts_settings)
        
        -- 大規模リポジトリ用のroot_dir最適化
        if is_large_repo then
          server_config.root_dir = lsp_optimize.get_optimized_root_dir({"package.json", "tsconfig.json", "deno.json", "deno.jsonc"})
        end
      end
      
      require("lspconfig")[server_name].setup(server_config)
    end
  }
}

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "single"
  }
})

-- Denolsの設定（プロジェクトタイプに応じて起動）
-- 大規模リポジトリの場合は最適化設定を適用
local denols_config = {
  capabilities = capabilities,
  init_options = {
    lint = true,
    unstable = true,
  },
  root_dir = require'lspconfig'.util.root_pattern("deno.json", "deno.jsonc"),
  single_file_support = false,
}

-- 大規模リポジトリ向けの追加設定
if is_large_repo then
  local optimized_config = lsp_optimize.get_optimized_client_config(is_large_repo)
  denols_config = vim.tbl_deep_extend("force", denols_config, optimized_config)
  denols_config.root_dir = lsp_optimize.get_optimized_root_dir({"deno.json", "deno.jsonc"})
end

lspconfig.denols.setup(denols_config)

function PrintDiagnosticConfig()
    local config = vim.diagnostic.config()
    print(vim.inspect(config))
end

vim.api.nvim_set_keymap('n', '<c-m>', '<cmd>lua ShowDiagnostics()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua PrintDiagnosticConfig()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = vim.api.nvim_get_hl_by_name('Normal', true).background })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = vim.api.nvim_get_hl_by_name('Normal', true).background })

vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})

-- vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })

vim.o.mousemoveevent = true

--cmp
-- require('luasnip.loaders.from_vscode').lazy_load()
--
-- cmp.setup({
--     snippet = {
--       expand = function(args)
--         luasnip.lsp_expand(args.body)
--       end,
--     },
--     window = {
--       completion = cmp.config.window.bordered({
--         order = 'single'
--       }),
--       documentation = cmp.config.window.bordered({
--         border = 'single'
--       }),
--     },
--     mapping = cmp.mapping.preset.insert({
--       ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.abort(),
--       ['<CR>'] = cmp.mapping.confirm({ select = true }),
--     }),
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       { name = 'vsnip' },
--     }, {
--       { name = 'buffer' },
--     })
--   })
--
--   cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--       { name = 'git' },
--     }, {
--       { name = 'buffer' },
--     })
--   })
--
--   cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'buffer' }
--     }
--   })
--
--   cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'nvim_lsp' },
--       { name = 'luasnip' },
--       { name = 'buffer' },
--     },
-- })

local map = vim.api.nvim_set_keymap
-- dap-ui key map
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true})
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true})

-- dap-go key map
map("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", { silent = true })

