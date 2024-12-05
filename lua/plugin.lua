require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',

    -- "~/.config/nvim/lua/extension/hello.nvim",
    "fs0414/hello.nvim",
    -- run = function()
    --   vim.cmd [[
    --   cd ~/.local/share/nvim/site/pack/packer/start/hello.nvim
    --   go build -o lua/hello.so -buildmode=plugin
    --   ]]
    -- end,

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
    -- 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',

    -- lsp
    'williamboman/mason.nvim',
      config = function() require 'extensions.mason' end,
    'williamboman/mason-lspconfig.nvim',
    "neovim/nvim-lspconfig",
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
    "microsoft/vscode-js-debug",
    opt = false,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle",

    -- run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    'mfussenegger/nvim-dap',
    "jay-babu/mason-nvim-dap.nvim",
    requires = {
      'rcarriga/nvim-dap-ui',
      "nvim-neotest/nvim-nio",
      {
        'mxsdev/nvim-dap-vscode-js',
        requires = {'mfussenegger/nvim-dap'},
      },
      {
        'leoluz/nvim-dap-go',
      }
    },
    'rcarriga/nvim-dap-ui',
    "nvim-neotest/nvim-nio",
    'mxsdev/nvim-dap-vscode-js',
      -- run = 'npm install --legacy-peer-deps && npm run compile',
    'leoluz/nvim-dap-go',

    -- lualine
    'nvim-lualine/lualine.nvim',

    -- barbar
    -- "lewis6991/gitsigns.nvim",
    -- "romgrk/barbar.nvim",
    -- config = function ()
    --   require('barbar').setup {
    --     options = {
    --       show_tab_indicators = true,
    --       show_close_icon = false,
    --       show_buffer_close_icons = false,
    --       separator_style = "thin",
    --       always_show_bufferline = false,
    --       animation = false,
    --     }
    --   }
    -- end,

    -- icon
    'nvim-tree/nvim-web-devicons',
    config = function ()
      require('nvim-web-devicons').setup{}
    end,

    -- noice
    'folke/noice.nvim',

    -- autosave
    "Pocco81/auto-save.nvim",
    config = function()
		 require("auto-save").setup {}
	end,

    -- telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'BurntSushi/ripgrep',
    'duane9/nvim-rg',

    -- fzf-lua
    "ibhagwan/fzf-lua",

    -- git
    'lewis6991/gitsigns.nvim',
    'dinhhuy258/git.nvim',
    "kdheepak/lazygit.nvim",
      requires = {
          "nvim-lua/plenary.nvim",
      },
    "NeogitOrg/neogit",
    "sindrets/diffview.nvim",

    -- comment
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,

    -- hlchunk
    "shellRaining/hlchunk.nvim",

    -- fm
    'is0n/fm-nvim',
    config = function() require 'extensions.gitsigns' end,

    -- comment
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,

    -- noice
    'folke/noice.nvim',
    'MunifTanjim/nui.nvim',
    "rcarriga/nvim-notify",

    -- atac
    "NachoNievaG/atac.nvim",
    requires = { "akinsho/toggleterm.nvim" },
    config = function() require('atac').setup({
      dir = "~/my/work/directory",
    }) end,

    --denops
    'vim-denops/denops.vim',

    -- lsp_signature
    'ray-x/lsp_signature.nvim',

    -- rayso
    'ryoppippi/ray-so.vim',
    'vim-denops/denops.vim',

    -- filer
    'lambdalisue/fern.vim',
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',
    "stevearc/oil.nvim",

    -- snippy 
    'dcampos/nvim-snippy',

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
