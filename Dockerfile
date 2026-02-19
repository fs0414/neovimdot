# ============================================================
# Stage 1: Download & build tools (not included in final image)
# ============================================================
FROM ubuntu:24.04 AS builder

ARG TARGETARCH
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# lua-language-server
ARG LUA_LS_VERSION=3.13.6
RUN LUA_LS_ARCH=$([ "$TARGETARCH" = "arm64" ] && echo "linux-arm64" || echo "linux-x64") \
    && wget -qO /tmp/lua-ls.tar.gz \
       "https://github.com/LuaLS/lua-language-server/releases/download/${LUA_LS_VERSION}/lua-language-server-${LUA_LS_VERSION}-${LUA_LS_ARCH}.tar.gz" \
    && mkdir -p /opt/lua-language-server \
    && tar xzf /tmp/lua-ls.tar.gz -C /opt/lua-language-server

# stylua
ARG STYLUA_VERSION=2.0.2
RUN STYLUA_ARCH=$([ "$TARGETARCH" = "arm64" ] && echo "linux-aarch64" || echo "linux-x86_64") \
    && wget -qO /tmp/stylua.zip \
       "https://github.com/JohnnyMorganz/StyLua/releases/download/v${STYLUA_VERSION}/stylua-${STYLUA_ARCH}.zip" \
    && unzip /tmp/stylua.zip -d /usr/local/bin/

# ============================================================
# Stage 2: Final image
# ============================================================
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    HOME=/root \
    XDG_CONFIG_HOME=/root/.config \
    XDG_DATA_HOME=/root/.local/share \
    XDG_STATE_HOME=/root/.local/state \
    XDG_CACHE_HOME=/root/.cache

# Neovim + Node.js + core tools (merged into a single RUN layer)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       software-properties-common curl ca-certificates \
    && add-apt-repository -y ppa:neovim-ppa/unstable \
    && apt-get update \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y --no-install-recommends \
       neovim nodejs git ripgrep fd-find xclip \
       build-essential ca-certificates \
    && ln -sf /usr/bin/fdfind /usr/bin/fd \
    # npm global tools
    && npm install -g --prefer-offline \
       typescript-language-server typescript \
       vscode-langservers-extracted \
       @fsouza/prettierd prettier \
       pnpm \
    # cleanup
    && apt-get purge -y software-properties-common \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.npm/_cacache

# Copy static binaries from builder stage
COPY --from=builder /opt/lua-language-server /opt/lua-language-server
COPY --from=builder /usr/local/bin/stylua /usr/local/bin/stylua
RUN ln -sf /opt/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server

# Copy Neovim config
COPY . /root/.config/nvim/

# Pre-install plugins
RUN nvim --headless "+Lazy! sync" +qa

# Pre-install Treesitter parsers
RUN nvim --headless \
    -c "TSInstallSync lua javascript typescript tsx rust go ruby html css json yaml toml markdown bash vim vimdoc" \
    -c "qa"

WORKDIR /workspace
ENTRYPOINT ["nvim"]
CMD ["."]
