# Neovim Configuration

## Environment
- macOS
- Homebrew
- Neovim 0.11+
- zsh/bash

## Setup

### 1. Prerequisites Check

```bash
# Check if Homebrew is installed
which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Verify git is available
git --version || brew install git
```

### 2. Install Core Dependencies (Required)

```bash
# Install Neovim (latest stable, 0.11+ required)
brew install neovim

# Install search tools (snacks.picker uses these)
brew install ripgrep fd

# Verify installations
nvim --version  # Should be 0.11.0 or higher
rg --version
fd --version
```

### 3. Install Optional Dependencies

Install based on your language and workflow needs:

```bash
# Node.js (required for JS/TS development)
brew install mise
mise install node@22
mise use --global node@22

# pnpm (required for biome LSP)
npm install -g pnpm

# lazygit (Git TUI, used by :LazyGit)
brew install lazygit

# fzf (general-purpose fuzzy finder)
brew install fzf

# uv (required for Python development)
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### 4. Clone Configuration

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

### 5. Install Nerd Fonts

Nerd Fonts are required for proper icon display in the UI:

```bash
# Install recommended font
brew install --cask font-hack-nerd-font

# Alternative fonts (choose one)
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-meslo-lg-nerd-font

# Set your terminal to use the installed Nerd Font
```

### 6. First Launch & Plugin Installation

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
# - Clipboard: Should show OK
```

### 7. Language Server Setup

LSP servers are configured natively using Neovim 0.11+ `vim.lsp.config()` / `vim.lsp.enable()`.
Server configs are in the `lsp/` directory. Install the servers manually:

```bash
# TypeScript/JavaScript
npm install -g typescript typescript-language-server

# Biome (project-local, via pnpm)
# Add biome to each project: pnpm add -D @biomejs/biome

# Deno (only activates when deno.json exists in project)
brew install deno

# Ruby
gem install ruby-lsp

# Go
go install golang.org/x/tools/gopls@latest

# Rust
rustup component add rust-analyzer

# Python
uv tool install ty

# Lua
brew install lua-language-server
```

## Configuration Files

| File | Description |
|------|-------------|
| `init.lua` | Main entry point |
| `lua/config/lazy.lua` | Plugin management (Lazy.nvim) |
| `lua/core/options.lua` | Base settings (leader=" ") |
| `lua/core/autocmds.lua` | Auto commands |
| `lua/core/commands.lua` | Custom commands (Sed, Cfp, Crp, Fmt etc.) |
| `lua/keymaps/` | Key mappings (init, lsp, picker, git, terminal etc.) |
| `lua/lsp/init.lua` | LSP configuration (vim.lsp.enable) |
| `lua/plugins/` | Plugin-specific configs |
| `lua/ui/highlights.lua` | Highlight settings |
| `lsp/*.lua` | LSP server configs (vim.lsp.Config format) |

## Key Bindings

### Completion (Blink.cmp)
- `Tab`/`Shift-Tab`: Navigate candidates
- `Ctrl-Space`: Show completion menu / toggle documentation
- `Enter`: Confirm
- `Ctrl-e`: Cancel

### LSP
- `K`: Hover documentation
- `gd`: Go to definition (picker)
- `gr`: Find references (picker)
- `gi`: Go to implementation
- `gt`: Go to type definition
- `<F2>`: Rename symbol
- `<leader>a`: Code action
- `[d` / `]d`: Previous / next diagnostic
- `<leader>d`: Diagnostic float
- `<leader>dl`: Diagnostic list

### Picker (snacks.picker)
- `<C-p>`: Find files
- `<C-g>`: Grep
- `<C-f>`: Lines in buffer
- `<C-b>`: Buffers
- `<C-l>`: Recent files
- `<leader>sw`: Grep word under cursor
- `<leader>ds`: Document symbols
- `<leader>ws`: Workspace symbols

## Docker

Run the same Neovim environment anywhere without local setup.

```bash
# Open current directory in Neovim
docker run -it --rm -v "$(pwd)":/workspace sora041490/nvim-config

# Open a specific file
docker run -it --rm -v "$(pwd)":/workspace sora041490/nvim-config src/main.ts

# With git config mounted
docker run -it --rm \
  -v "$(pwd)":/workspace \
  -v "$HOME/.gitconfig":/root/.gitconfig:ro \
  -v "$HOME/.ssh":/root/.ssh:ro \
  sora041490/nvim-config
```

The image includes Neovim, Node.js 22, LSPs (typescript-language-server, lua-language-server, vscode-langservers-extracted), formatters (prettierd, stylua), and all plugins pre-installed. Supports `linux/amd64` and `linux/arm64`.

With [go-task](https://taskfile.dev/) installed:

```bash
task build          # Build image locally
task run            # Open current directory
task run:git        # With git config mounted
task shell          # Debug shell
task version        # Check Neovim version
```

See [Docker Hub](https://hub.docker.com/r/sora041490/nvim-config) for more details.

## Updates

```bash
# Update plugins
:Lazy sync
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
