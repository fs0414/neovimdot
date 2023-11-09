require('nvim-autopairs').setup{}

require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',
    --colorSchema
    'folke/tokyonight.nvim',
    'davidcelis/vim-ariake-dark',
    'fcpg/vim-orbital',
    'shaunsingh/moonlight.nvim',
    'tjdevries/colorbuddy.nvim',
    'svrana/neosolarized.nvim',
    'ishan9299/nvim-solarized-lua',
    'neovim/nvim-lsp',
    -- mason
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    "neovim/nvim-lspconfig",
    --coc
    --'neoclide/coc.nvim', branch = 'release',
    -- cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    -- yank
    'svermeulen/vim-yoink',
    -- authrairs
    'windwp/nvim-autopairs',
    -- ?
    'windwp/nvim-autopairs',
    'tjdevries/colorbuddy.vim',
    'Shougo/pum.vim',
    }
end)
