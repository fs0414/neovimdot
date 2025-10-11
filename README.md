# Neovim Configuration

## 環境
- macOS (M1/M2/Intel)
- Homebrew
- zsh/bash

## セットアップ

### 1. 必要なツールのインストール

```bash
# Neovimと依存関係をインストール
brew install neovim node npm python3 ripgrep fd fzf lazygit
```

### 2. 設定ファイルのクローン

```bash
# .configディレクトリがなければ作成
mkdir -p ~/.config

# リポジトリをクローン
git clone https://github.com/fs0414/neovimdot.git ~/.config/nvim
```

### 3. Nerd Fontsのインストール

アイコン表示のためNerd Fontが必要です：

```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

### 4. 初回起動

```bash
# Neovimを起動（Lazy.nvimが自動でプラグインをインストール）
nvim

# インストール完了後、一度終了して再起動
:q
nvim

# 動作確認
:checkhealth
```

### 5. 言語サーバーのセットアップ

Neovim内でMasonを使って必要な言語サーバーをインストール：

```vim
:Mason
```

よく使う言語の追加セットアップ：

```bash
# TypeScript/JavaScript
npm install -g typescript typescript-language-server @fsouza/prettierd eslint_d

# Python
pip3 install --user pynvim black flake8

# Go
go install golang.org/x/tools/gopls@latest

# Rust
rustup component add rust-analyzer
```

## 主な設定ファイル

| ファイル | 説明 |
|---------|------|
| `init.lua` | メインエントリーポイント |
| `lua/config/lazy.lua` | プラグイン管理（Lazy.nvim） |
| `lua/base.lua` | 基本設定 |
| `lua/keymap.lua` | キーマッピング |
| `lua/lsp-config.lua` | LSP設定 |
| `lua/blink-conf.lua` | 補完エンジン設定 |

## 主要なキーバインド

### 補完（Blink.cmp）
- `Tab`/`Shift-Tab`: 候補の選択
- `Ctrl-Space`: 補完メニュー表示
- `Enter`: 確定
- `Ctrl-e`: キャンセル

### LSP
- `K`: ホバー情報
- `gr`: 参照検索
- `gi`: 実装へジャンプ
- `gD`: 宣言へジャンプ

## プラグイン更新

```bash
# プラグインを更新
:Lazy sync

# LSPサーバーを更新
:MasonUpdate
```

## トラブルシューティング

```vim
# 全体の状態確認
:checkhealth

# LSP状態確認
:LspInfo

# プラグイン状態確認
:Lazy health
```
