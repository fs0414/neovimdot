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
  -- colorSchema (即時読み込み)
  { "fcpg/vim-orbital", lazy = false },

  -- treesitter (即時読み込み)
  { "nvim-treesitter/nvim-treesitter", lazy = false },

  -- markview (マークダウン時のみ)
  { "OXY2DEV/markview.nvim", ft = { "markdown", "md" } },

  -- snippets
  "rafamadriz/friendly-snippets",

  -- snacks (即時読み込み)
  { "folke/snacks.nvim", lazy = false },

  -- mini
  { "echasnovski/mini.icons", lazy = false },
  { "nvim-mini/mini.test", cmd = "MiniTest" },

  -- blink (補完: 即時読み込み)
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    version = '1.*',
  },

  -- dap (デバッグ時のみ)
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle",
  },
  { "mfussenegger/nvim-dap", cmd = { "DapToggleBreakpoint", "DapContinue" } },
  { "rcarriga/nvim-dap-ui", lazy = true },
  { "nvim-neotest/nvim-nio", lazy = true },
  {
    "mxsdev/nvim-dap-vscode-js",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
  },
  { "leoluz/nvim-dap-go", ft = "go" },

  -- lualine (即時読み込み)
  { "nvim-lualine/lualine.nvim", lazy = false },

  -- autosave (即時読み込み)
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup({})
    end,
  },

  -- search/replace
  { "duane9/nvim-rg", cmd = "Rg" },
  { "MagicDuck/grug-far.nvim", cmd = "GrugFar" },

  -- git
  { "lewis6991/gitsigns.nvim", event = "BufReadPre" },
  { "dinhhuy258/git.nvim", cmd = { "Git", "GitBlame" } },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  { "NeogitOrg/neogit", cmd = "Neogit" },
  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },
  { "Morozzzko/git_browse.nvim", cmd = "GitBrowse" },
  { "lambdalisue/vim-gin", cmd = { "Gin", "GinStatus", "GinDiff" } },
  { "FabijanZulj/blame.nvim", cmd = "BlameToggle" },

  -- comment (即時読み込み)
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup({})
    end,
  },

  -- hlchunk (バッファ読み込み時)
  { "shellRaining/hlchunk.nvim", event = "BufReadPre" },

  -- atac (コマンド時のみ)
  {
    "NachoNievaG/atac.nvim",
    cmd = "Atac",
    config = function()
      require("atac").setup({
        dir = "~/my/work/directory",
      })
    end,
  },

  -- denops
  { "vim-denops/denops.vim", lazy = false },


  -- rayso (コマンド時のみ)
  { "ryoppippi/ray-so.vim", cmd = "RaySo" },

  -- filer
  { "lambdalisue/nerdfont.vim", lazy = false },
  { "stevearc/oil.nvim", lazy = false },
  {
    "A7Lavinraj/fyler.nvim",
    cmd = "Fyler",
    config = function()
      require("fyler").setup({})
    end,
  },

  -- formatter (即時読み込み)
  { "stevearc/conform.nvim", lazy = false },

  -- snippy
  { "dcampos/nvim-snippy", event = "InsertEnter" },

  -- neotest (コマンド時のみ)
  { "nvim-neotest/neotest", cmd = "Neotest" },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "antoinemadec/FixCursorHold.nvim", lazy = true },
  { "marilari88/neotest-vitest", lazy = true },

  -- autopairs (入力時)
  { "windwp/nvim-autopairs", event = "InsertEnter" },

  -- yank
  { "svermeulen/vim-yoink", lazy = false },

  -- toggleterm (コマンド時のみ)
  { "akinsho/toggleterm.nvim", cmd = { "ToggleTerm", "TermExec" } },

  -- copilot (入力時)
  { "github/copilot.vim", event = "InsertEnter" },
}, {
  -- Lazy.nvim configuration options
  defaults = {
    lazy = true, -- デフォルトで遅延読み込み
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
