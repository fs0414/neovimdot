local vim = vim

-- LSP起動速度最適化の設定
local M = {}

-- 大規模リポジトリの検出
M.is_large_repo = function()
  local handle = io.popen("find . -type f -name '*.js' -o -name '*.ts' -o -name '*.jsx' -o -name '*.tsx' 2>/dev/null | head -1000 | wc -l")
  if handle then
    local result = handle:read("*a")
    handle:close()
    local file_count = tonumber(result) or 0
    -- 1000ファイル以上なら大規模と判定
    return file_count >= 1000
  end
  return false
end

-- 大規模リポジトリ向けのワークスペース設定
M.get_large_repo_workspace_config = function()
  return {
    -- 巨大ディレクトリを除外
    ignorePatterns = {
      "**/node_modules/**",
      "**/dist/**",
      "**/build/**",
      "**/.git/**",
      "**/vendor/**",
      "**/target/**",  -- Rust
      "**/.next/**",    -- Next.js
      "**/.nuxt/**",    -- Nuxt
      "**/coverage/**",
      "**/.cache/**",
      "**/tmp/**",
    },
    -- ファイル監視を制限
    didChangeWatchedFiles = {
      dynamicRegistration = false,
      relativePatternSupport = false,
    },
    -- ワークスペースシンボル検索を遅延
    symbol = {
      dynamicRegistration = false,
    }
  }
end

-- TypeScript/JavaScript向けの最適化設定
M.get_ts_optimized_settings = function()
  return {
    init_options = {
      hostInfo = "neovim",
      -- プロジェクトロード戦略を最適化
      preferences = {
        includePackageJsonAutoImports = "off",
        lazyConfiguredProjectsFromExternalProject = true,
        includeCompletionsForModuleExports = false,
        includeCompletionsWithInsertText = false,
      },
      -- 最大メモリ使用量を制限 (MB)
      maxTsServerMemory = 4096,
    },
    -- 型定義ファイルの自動ダウンロードを無効化
    typescript = {
      enablePromptUseWorkspaceTsdk = false,
      surveys = { enabled = false },
    },
    javascript = {
      suggest = {
        completeFunctionCalls = false,
      },
    },
    -- 診断を制限
    diagnostics = {
      -- 開いているファイルのみ診断
      onlyCurrentFile = true,
      -- 診断の遅延時間
      delay = 500,
    },
  }
end

-- LSPハンドラーの最適化設定
M.setup_optimized_handlers = function()
  -- hover処理の最適化
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
      border = "single",
      width = 70,
      height = 10,
      focusable = false,
      -- 遅延を短縮
      delay = 150,
    }
  )

  -- signature help処理の最適化
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
      border = "single",
      focusable = false,
      delay = 150,
    }
  )
  
  -- diagnosticsの更新頻度を最適化
  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    -- フロートウィンドウの遅延を設定
    float = {
      delay = 200,
      show_header = true,
      source = 'if_many',
      border = 'rounded',
      focusable = true,
    },
  })
end

-- LSPクライアントの起動オプション最適化
M.get_optimized_client_config = function(is_large_repo)
  local base_config = {
    flags = {
      -- デバウンス時間を最適化（大規模リポジトリではより長く）
      debounce_text_changes = is_large_repo and 200 or 100,
      -- 起動時の初期化を高速化
      allow_incremental_sync = true,
      -- 終了時のタイムアウトを短縮
      exit_timeout = false,
    },
  }
  
  -- 大規模リポジトリの場合、追加の最適化
  if is_large_repo then
    base_config.single_file_support = true
    base_config.workspace_folders = nil  -- 初期はワークスペースフォルダを設定しない
  end
  
  return base_config
end

-- root_dir の最適化関数
M.get_optimized_root_dir = function(patterns)
  return function(fname)
    local lspconfig = require('lspconfig')
    -- モノレポの場合、最も近いpackage.jsonを探す
    local nearest_package = lspconfig.util.root_pattern("package.json")(fname)
    if nearest_package then
      -- node_modulesが巨大でないかチェック
      local node_modules = nearest_package .. "/node_modules"
      if vim.fn.isdirectory(node_modules) == 1 then
        -- node_modulesのサイズを簡易チェック
        local handle = io.popen("du -s " .. node_modules .. " 2>/dev/null | cut -f1")
        if handle then
          local size = tonumber(handle:read("*a")) or 0
          handle:close()
          -- 500MB以上なら親ディレクトリを使用
          if size > 500000 then
            return vim.fn.fnamemodify(nearest_package, ":h")
          end
        end
      end
      return nearest_package
    end
    -- フォールバック
    return lspconfig.util.root_pattern(unpack(patterns or {".git", "Makefile"}))(fname)
  end
end

-- ファイルタイプごとのLSP起動を制御
M.setup_filetype_lazy_loading = function()
  -- TypeScript/JavaScript系のLSPは該当ファイルを開いた時のみ起動
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function()
      -- プロジェクトタイプに応じて適切なLSPを起動
      local project_type = vim.g.project_type_cache or 'default'
      if project_type == 'deno' then
        vim.cmd('LspStart denols')
      else
        vim.cmd('LspStart ts_ls')
      end
    end,
    once = true,
  })

  -- その他の言語も同様に遅延起動
  local language_lsp_map = {
    python = 'pyright',
    rust = 'rust_analyzer',
    go = 'gopls',
    lua = 'lua_ls',
    ruby = 'solargraph',
  }

  for filetype, lsp_name in pairs(language_lsp_map) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetype,
      callback = function()
        vim.cmd('LspStart ' .. lsp_name)
      end,
      once = true,
    })
  end
end

-- 初期化関数
M.setup = function()
  M.setup_optimized_handlers()
  -- ファイルタイプごとの遅延読み込みは任意で有効化
  -- M.setup_filetype_lazy_loading()
end

return M