require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',

    -- colorSchema
    'folke/tokyonight.nvim',
    'davidcelis/vim-ariake-dark',
    'fcpg/vim-orbital',
    'shaunsingh/moonlight.nvim',
    'tjdevries/colorbuddy.nvim',
    'svrana/;eosolarized.nvim',
    'ishan9299/nvim-solarized-lua',
    'oxfist/night-owl.nvim',
    'scottmckendry/cyberdream.nvim',
    'neovim/nvim-lsp',

    -- mason
    'williamboman/mason.nvim',
      config = function() require 'extensions.mason' end,
    'williamboman/mason-lspconfig.nvim',
    "neovim/nvim-lspconfig",

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
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',

    ---- lualine
    'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },

    -- telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'BurntSushi/ripgrep',
    'duane9/nvim-rg',

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
