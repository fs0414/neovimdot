# Neovim Configuration

## Environment
- macOS 
- Homebrew
- zsh/bash

## Setup

### 1. Prerequisites Check

```bash
# Check if Homebrew is installed
which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Verify git is available
git --version || brew install git
```

### 2. Install Core Dependencies

```bash
# Install Neovim (latest stable)
brew install neovim

# Install essential tools for LSP and searching
brew install node npm ripgrep fd fzf lazygit

# Install Python version manager (uv)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Verify installations
nvim --version  # Should be 0.9.0 or higher
node --version  # Should be 18.0 or higher
rg --version    # ripgrep for fast searching
```

### 3. Clone Configuration

```bash
# Backup existing config if present
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup

# Create config directory
mkdir -p ~/.config

# Clone this repository
git clone https://github.com/fs0414/neovimdot.git ~/.config/nvim

# Verify clone was successful
ls -la ~/.config/nvim/init.lua
```

### 4. Install Nerd Fonts

Nerd Fonts are required for proper icon display in the UI:

```bash
# Add fonts tap
brew tap homebrew/cask-fonts

# Install recommended font
brew install --cask font-hack-nerd-font

# Alternative fonts (choose one)
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-meslo-lg-nerd-font

# Set your terminal to use the installed Nerd Font
```

### 5. First Launch & Plugin Installation

```bash
# Launch Neovim - plugins will auto-install on first run
nvim

# Wait for Lazy.nvim to complete installation (bottom of screen)
# You'll see "Plugins installed" when complete

# Once done, quit Neovim
:q

# Restart to ensure all plugins are loaded
nvim

# Check installation health
:checkhealth

# Common issues to look for:
# - Node.js provider: Should show OK
# - Python provider: Should show OK (if using Python)
# - Clipboard: Should show OK
```

### 6. Language Server Setup

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
