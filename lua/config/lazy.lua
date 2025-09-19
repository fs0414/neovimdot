local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- local
  { dir = "~/.config/nvim/lua/extension/hello.nvim" },

  -- colorSchema
  "folke/tokyonight.nvim",
  "davidcelis/vim-ariake-dark",
  {
    "fcpg/vim-orbital",
    lazy = false,
    priority = 1000, -- Load this before other plugins
  },
  "shaunsingh/moonlight.nvim",
  "tjdevries/colorbuddy.nvim",
  "ishan9299/nvim-solarized-lua",
  "oxfist/night-owl.nvim",
  "scottmckendry/cyberdream.nvim",
  "neovim/nvim-lsp",
  "atmosuwiryo/vim-winteriscoming",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- lsp
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "lewis6991/hover.nvim",

  -- nvim-ruby-lsp
  "mihyaeru21/nvim-ruby-lsp",

  -- cmp
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- snacks
  "folke/snacks.nvim",

  -- blink
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    version = '1.*',
  },

  -- dap
  "microsoft/vscode-js-debug",
  lazy = false,
  build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle",

  "mfussenegger/nvim-dap",
  "jay-babu/mason-nvim-dap.nvim",
  "rcarriga/nvim-dap-ui",
  "nvim-neotest/nvim-nio",
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  "leoluz/nvim-dap-go",

  -- lualine
  "nvim-lualine/lualine.nvim",

  -- icon
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({})
    end,
  },
  {
    "echasnovski/mini.icons",
    config = function()
      require("mini.icons").setup({})
    end,
  },

  -- autosave
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
    end,
  },

  "BurntSushi/ripgrep",
  "duane9/nvim-rg",

  -- git
  "lewis6991/gitsigns.nvim",
  "dinhhuy258/git.nvim",
  "kdheepak/lazygit.nvim",
  "NeogitOrg/neogit",
  "sindrets/diffview.nvim",
  "Morozzzko/git_browse.nvim",
  "lambdalisue/vim-gin",
  "FabijanZulj/blame.nvim",

  -- comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  },

  -- hlchunk
  "shellRaining/hlchunk.nvim",

  -- fm
  "is0n/fm-nvim",

  -- atac
  {
    "NachoNievaG/atac.nvim",
    config = function()
      require("atac").setup({
        dir = "~/my/work/directory",
      })
    end,
  },

  -- denops
  "vim-denops/denops.vim",
  "vim-denops/denops-helloworld.vim",

  -- lsp_signature
  "ray-x/lsp_signature.nvim",

  -- rayso
  "ryoppippi/ray-so.vim",

  -- filer
  "lambdalisue/nerdfont.vim",
  "stevearc/oil.nvim",
  {
    "A7Lavinraj/fyler.nvim",
    config = function()
      require("fyler").setup({})
    end,
  },

  -- formatter
  "stevearc/conform.nvim",

  -- snippy
  "dcampos/nvim-snippy",

  -- neotest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
    },
  },

  -- autopairs
  "windwp/nvim-autopairs",

  -- nvim-tree
  "nvim-tree/nvim-tree.lua",

  -- yank
  "svermeulen/vim-yoink",

  -- toggleterm
  "akinsho/toggleterm.nvim",

  -- colorbuddy
  "tjdevries/colorbuddy.vim",

  -- ale
  "w0rp/ale",

  -- copilot
  "github/copilot.vim",

  -- pum
  "Shougo/pum.vim",
}, {
  -- Lazy.nvim configuration options
  defaults = {
    lazy = false, -- Load plugins immediately by default
  },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
