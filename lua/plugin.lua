local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local status = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

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
    --'hrsh7th/cmp-nvim-lsp',
    --'hrsh7th/cmp-buffer',
    --'hrsh7th/cmp-path',
    --'hrsh7th/cmp-cmdline',
    --'hrsh7th/nvim-cmp',
    -- yank
    'svermeulen/vim-yoink',
    -- ?
    'windwp/nvim-autopairs',
    'tjdevries/colorbuddy.vim',
    'Shougo/pum.vim',
    }
end)
