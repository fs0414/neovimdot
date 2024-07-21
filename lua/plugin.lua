require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',

    -- colorSchema
    'folke/tokyonight.nvim',
    'davidcelis/vim-ariake-dark',
    'fcpg/vim-orbital',
    'shaunsingh/moonlight.nvim',
    'tjdevries/colorbuddy.nvim',
    'ishan9299/nvim-solarized-lua',
    'oxfist/night-owl.nvim',
    'scottmckendry/cyberdream.nvim',
    'neovim/nvim-lsp',
    "atmosuwiryo/vim-winteriscoming",
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',

    -- lsp
    'williamboman/mason.nvim',
      config = function() require 'extensions.mason' end,
    'williamboman/mason-lspconfig.nvim',
    "neovim/nvim-lspconfig",
    'tami5/lspsaga.nvim',
    'nvimdev/lspsaga.nvim',

     "lewis6991/hover.nvim",

    -- nvim-ruby-lsp
    'mihyaeru21/nvim-ruby-lsp',

    -- cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    --dap
    "jay-babu/mason-nvim-dap.nvim",
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
    --'mxsdev/nvim-dap-vscode-js',
    --{
    --  "microsoft/vscode-js-debug",
    --  opt = true,
    --  run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    --},
    --config = function ()
    --    vim.fn.sign_define('DapBreakpoint', {text='⛔', texthl='', linehl='', numhl=''})
    --    vim.fn.sign_define('DapStopped', {text='👉', texthl='', linehl='', numhl=''})
    --    require('dapui').setup()
    --    require('dap-go').setup()
    --    require("dap-vscode-js").setup()
    --    require('dap.ext.vscode').load_launchjs()
    --end,

    -- lualine
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },

    -- telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'BurntSushi/ripgrep',
    'duane9/nvim-rg',

    -- git
    'lewis6991/gitsigns.nvim',
    'dinhhuy258/git.nvim',

  -- tag = 'release',
  config = function() require 'extensions.gitsigns' end,

    -- noice
    --"folke/noice.nvim",
    --requires = {
    --  "MunifTanjim/nui.nvim",
    --  "rcarriga/nvim-notify",
    --},

    --'folke/noice.nvim',
    --event = "VimEnter",
    --requires = {
    --  -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --  "MunifTanjim/nui.nvim",
    --  "rcarriga/nvim-notify",
    --},

    'folke/noice.nvim',
    'MunifTanjim/nui.nvim',
    "rcarriga/nvim-notify",

    -- atac
    "NachoNievaG/atac.nvim",
        requires = { "akinsho/toggleterm.nvim" },
        config = function() require('atac').setup({
            dir = "~/my/work/directory", -- By default, the dir will be set as /tmp/atac
        }) end,

    -- lsp_signature
    'ray-x/lsp_signature.nvim',

    -- rayso
    'ryoppippi/ray-so.vim',
    'vim-denops/denops.vim',

    -- filer
    'lambdalisue/fern.vim',
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',

    --neotest
    'nvim-neotest/neotest',
    "nvim-neotest/nvim-nio",
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'marilari88/neotest-vitest',

    -- authrairs
    'windwp/nvim-autopairs',
    -- nvim-tree
    'nvim-tree/nvim-tree.lua',
    -- yank
    'svermeulen/vim-yoink',
    -- plenary
    "nvim-lua/plenary.nvim",
    -- toggleterm
    'akinsho/toggleterm.nvim',
    -- colorbuddy
    'tjdevries/colorbuddy.vim',
    -- ale
    'w0rp/ale',
    -- copilot
    "github/copilot.vim",
    -- ?
    'windwp/nvim-autopairs',
    'Shougo/pum.vim',
    }
end)
