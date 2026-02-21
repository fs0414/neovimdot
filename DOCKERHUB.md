# nvim-config

Portable Neovim environment as a Docker image. Run your fully configured editor anywhere.

## Pull

```bash
docker pull sora041490/nvim-config
```

## Quick Start

```bash
docker run -it --rm -v "$(pwd)":/workspace sora041490/nvim-config
```

## What's Included

| Category | Tools |
|----------|-------|
| Editor | Neovim (unstable/nightly) |
| Node.js | Node.js 22 + pnpm |
| LSP | typescript-language-server, lua-language-server, vscode-langservers-extracted |
| Formatter | prettierd, prettier, stylua |
| CLI | git, ripgrep, fd |
| Plugins | Pre-installed via Lazy.nvim |
| Treesitter | Parsers pre-installed |

## Usage

### Basic

```bash
# Open current directory
docker run -it --rm -v "$(pwd)":/workspace sora041490/nvim-config

# Open a specific file
docker run -it --rm -v "$(pwd)":/workspace sora041490/nvim-config src/main.ts
```

### With Git Config

```bash
docker run -it --rm \
  -v "$(pwd)":/workspace \
  -v "$HOME/.gitconfig":/root/.gitconfig:ro \
  -v "$HOME/.ssh":/root/.ssh:ro \
  sora041490/nvim-config
```

### Debug Shell

```bash
docker run -it --rm --entrypoint bash -v "$(pwd)":/workspace sora041490/nvim-config
```

## Platforms

- `linux/amd64`
- `linux/arm64`

## Source

[GitHub](https://github.com/sorafujitani/neovimdot)
