# Neovim Configuration

## Environment
- macOS (M1/M2/Intel)
- Homebrew
- zsh/bash

## Setup

### 1. Install Dependencies

```bash
# Install Neovim and core tools
brew install neovim node npm ripgrep fd fzf lazygit
```

### 2. Clone Configuration

```bash
# Create config directory if needed
mkdir -p ~/.config

# Clone this repository
git clone https://github.com/fs0414/neovimdot.git ~/.config/nvim
```

### 3. Install Nerd Fonts

Required for icons display:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

### 4. Initial Launch

```bash
# Launch Neovim (Lazy.nvim will auto-install plugins)
nvim

# After installation completes, quit and restart
:q
nvim

# Verify installation
:checkhealth
```

### 5. Language Server Setup

Install language servers via Mason within Neovim:

```vim
:Mason
```

Additional language-specific setup:

```bash
# TypeScript/JavaScript
npm install -g typescript typescript-language-server @fsouza/prettierd eslint_d

# Ruby
gem install ruby-lsp rubocop

# Go
go install golang.org/x/tools/gopls@latest

# Rust
rustup component add rust-analyzer

# Python (using uv)
uv tool install ruff
uv tool install black
uv tool install mypy
uv pip install pynvim
```

## Configuration Files

| File | Description |
|------|-------------|
| `init.lua` | Main entry point |
| `lua/config/lazy.lua` | Plugin management (Lazy.nvim) |
| `lua/base.lua` | Base settings |
| `lua/keymap.lua` | Key mappings |
| `lua/lsp-config.lua` | LSP configuration |
| `lua/blink-conf.lua` | Completion engine config |

## Key Bindings

### Completion (Blink.cmp)
- `Tab`/`Shift-Tab`: Navigate candidates
- `Ctrl-Space`: Show completion menu
- `Enter`: Confirm
- `Ctrl-e`: Cancel

### LSP
- `K`: Hover documentation
- `gr`: Find references
- `gi`: Go to implementation
- `gD`: Go to declaration

## Updates

```bash
# Update plugins
:Lazy sync

# Update LSP servers
:MasonUpdate
```

## Troubleshooting

```vim
# Check overall health
:checkhealth

# Check LSP status
:LspInfo

# Check plugin status
:Lazy health
```
