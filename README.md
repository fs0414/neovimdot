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
docker run -it --rm \
  -v "$(pwd)":/workspace \
  -v "$HOME/.gitconfig":/root/.gitconfig:ro \
  -v "$HOME/.ssh":/root/.ssh:ro \
  sora041490/nvim-config

# Open a specific file
docker run -it --rm \
  -v "$(pwd)":/workspace \
  -v "$HOME/.gitconfig":/root/.gitconfig:ro \
  -v "$HOME/.ssh":/root/.ssh:ro \
  sora041490/nvim-config src/main.ts
```

Add an alias to your shell config (`~/.zshrc`, `~/.bashrc`, etc.) for quick access:

```bash
alias dvim='docker run -it --rm -v "$(pwd)":/workspace -v "$HOME/.gitconfig":/root/.gitconfig:ro -v "$HOME/.ssh":/root/.ssh:ro sora041490/nvim-config'
```

Then use it like a local editor:

```bash
dvim              # Open current directory
dvim src/main.ts  # Open a specific file
```

The image includes Neovim, Node.js 22, LSPs (typescript-language-server, lua-language-server, vscode-langservers-extracted), formatters (prettierd, stylua, shfmt), lazygit, fzf, and all plugins pre-installed. Supports `linux/amd64` and `linux/arm64`.

Language-specific tools (Go, Rust, Python, Ruby, Deno, etc.) are **not** included to keep the image small. Install them inside the container as needed:

```bash
# Enter a shell in the container
docker run -it --rm --entrypoint bash -v "$(pwd)":/workspace sora041490/nvim-config

# Go
apt-get update && apt-get install -y golang-go
go install golang.org/x/tools/gopls@latest
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
# rust-analyzer and rustfmt are included with rustup

# Python
apt-get update && apt-get install -y python3 python3-pip python3-venv
pip3 install --break-system-packages isort black ty

# Ruby
apt-get update && apt-get install -y ruby ruby-dev
gem install ruby-lsp

# Deno
curl -fsSL https://deno.land/install.sh | sh

# Biome (project-local recommended)
pnpm add -D @biomejs/biome
```

With [go-task](https://taskfile.dev/) installed:

```bash
task build          # Build image locally
task run            # Open current directory (with git config)
task shell          # Debug shell (with git config)
task version        # Check Neovim version
```

See [Docker Hub](https://hub.docker.com/r/sora041490/nvim-config) for more details.

## Adding a New Language

### 1. Create LSP server config

Add `lsp/<server_name>.lua`:

```lua
---@type vim.lsp.Config
return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', '.git' },
}
```

### 2. Enable the LSP server

Add the server name to `vim.lsp.enable()` in `lua/lsp/init.lua`:

```lua
vim.lsp.enable({
  -- ...existing servers
  "pyright",
})
```

### 3. Add Treesitter parser

Add the language to `ensure_installed` in `lua/config/lazy.lua`:

```lua
ensure_installed = {
  -- ...existing parsers
  "python",
},
```

If using Docker, also add it to the `install()` call in `Dockerfile`.

### 4. Add formatter (optional)

Add formatter rules in `lua/plugins/formatter.lua`:

```lua
python = { "isort", "black" },
```

### 5. Install the LSP binary

The binary specified in `cmd` must be available in your PATH:

```bash
# Example: Python
pip install pyright

# Example: via Homebrew
brew install pyright
```

For Docker, add the binary installation to `Dockerfile` as well.

### Checklist

| # | File | Action |
|---|------|--------|
| 1 | `lsp/<name>.lua` | Create server config |
| 2 | `lua/lsp/init.lua` | Add to `vim.lsp.enable()` |
| 3 | `lua/config/lazy.lua` | Add parser to `ensure_installed` |
| 4 | `lua/plugins/formatter.lua` | Add formatter (optional) |
| 5 | `Dockerfile` | Add parser + binary (optional) |

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
