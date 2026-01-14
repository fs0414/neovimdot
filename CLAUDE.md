# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Neovim設定リポジトリ (macOS環境向け)。Lazy.nvimでプラグイン管理、Neovim 0.11+の組み込みLSP機能を使用。

## Commands

```bash
# 設定をリロード (Neovim内)
:source %

# プラグイン管理
:Lazy sync          # プラグイン更新
:Lazy health        # 状態確認

# ヘルスチェック
:checkhealth

# LSP情報
:LspInfo            # アタッチ中のLSPクライアント表示
```

## Architecture

```
init.lua                    # エントリーポイント
├── lua/config/lazy.lua     # Lazy.nvimセットアップ＋プラグイン宣言
├── lua/core/
│   ├── options.lua         # vim.opt設定 (leader=" ")
│   ├── autocmds.lua        # 自動コマンド
│   └── commands.lua        # カスタムコマンド (Sed, Cfp, Crp, Fmt等)
├── lua/keymaps/
│   ├── init.lua            # 基本キーマップ＋サブモジュール読み込み
│   ├── lsp.lua             # LSP関連キーマップ
│   ├── picker.lua          # ファイル検索系
│   ├── git.lua             # Git操作
│   ├── file-explorer.lua   # Oil.nvim
│   ├── terminal.lua        # ToggleTerm
│   ├── debug.lua           # DAP (遅延読み込み)
│   └── test.lua            # Neotest (遅延読み込み)
├── lua/lsp/
│   ├── init.lua            # vim.lsp.enable()でサーバー有効化
│   ├── diagnostics.lua     # 診断設定
│   └── hover.lua           # ホバー設定
├── lua/plugins/
│   ├── init.lua            # プラグイン設定読み込み
│   └── *.lua               # 各プラグインの設定
├── lua/ui/
│   └── highlights.lua      # ハイライト設定
└── lsp/
    └── *.lua               # LSPサーバー設定 (vim.lsp.Config形式)
```

## LSP Configuration

Neovim 0.11+の`vim.lsp.config()`/`vim.lsp.enable()`を使用。

サーバー設定は`lsp/`ディレクトリに配置:
```lua
-- lsp/ts_ls.lua の例
---@type vim.lsp.Config
return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'typescript', ... },
  root_markers = { 'package.json', 'tsconfig.json' },
}
```

有効なサーバー: lua_ls, ts_ls, denols, biome, oxlint, rust_analyzer, ruby_lsp, gopls

## Lazy Loading Strategy

- 即時読み込み: colorscheme, treesitter, snacks, blink.cmp, lualine, oil
- イベント: gitsigns (BufReadPre), hlchunk (BufReadPre), autopairs (InsertEnter)
- コマンド: DAP, Neotest, LazyGit, GrugFar等
- DAP/Neotestは`:DapLoad`/`:NeotestLoad`コマンドで手動読み込み

## Custom Commands

| コマンド | 説明 |
|---------|------|
| `:Sed old new` | 全体置換 |
| `:Cfp` | フルパスをコピー |
| `:Crp` | 相対パスをコピー (行番号付き可) |
| `:Cfn` | ファイル名をコピー |
| `:Fmt` | conform.nvimでフォーマット |
| `:Nonts` | ts_ls停止 |
| `:Nondeno` | denols停止 |
| `:NotePush` | git add/commit/push一括実行 |
