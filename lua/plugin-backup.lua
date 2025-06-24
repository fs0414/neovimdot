require("lazy").setup({
	-- local

	-- colorSchema
	"folke/tokyonight.nvim",
	"davidcelis/vim-ariake-dark",
	"fcpg/vim-orbital",
	"shaunsingh/moonlight.nvim",
	"tjdevries/colorbuddy.nvim",
	"ishan9299/nvim-solarized-lua",
	"oxfist/night-owl.nvim",
	"scottmckendry/cyberdream.nvim",
	"neovim/nvim-lsp",
	"atmosuwiryo/vim-winteriscoming",
	"nvim-treesitter/nvim-treesitter",

	-- lsp
	-- "williamboman/mason.nvim",
	-- config = function()
	-- 	require("extensions.mason")
	-- end,
	-- "williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"lewis6991/hover.nvim",

  "mason-org/mason.nvim",
  "mason-org/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

	-- denops
	"vim-denops/denops.vim",
	"vim-denops/denops-helloworld.vim",

	-- complement
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"saghen/blink.cmp",
	version = "v0.13.1", -- 安定版指定
	build = "rustup default nightly && cargo build --release",
	-- build = "cargo build --release",  -- Rustビルド
	dependencies = {
		"hrsh7th/nvim-cmp", -- 互換性レイヤー
		"L3MON4D3/LuaSnip", -- スニペットエンジン
	},
	opts = {
		fuzzy = {
			implementation = "prefer_rust",
			prebuilt_binaries = {
				force_version = "0.13.1", -- 明示的バージョン指定
				download = true,
			},
		},
	},

	-- formatter
	"mhartington/formatter.nvim",

	-- luarocks
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},

	{
		-- markdown
		"MeanderingProgrammer/render-markdown.nvim",
		completions = { lsp = { enabled = true } },
		ft = { "markdown", "markdown.mdx", "Avante", "codecompanion" },
		file_types = { "markdown", "Avante", "codecompanion" },
		render_modes = true, -- Render in ALL modes
		sign = {
			enabled = false, -- Turn off in the status column
		},
	},

	"echasnovski/mini.nvim",

	-- lualine
	"nvim-lualine/lualine.nvim",

	-- quickfixs
	"kevinhwang91/nvim-bqf",

	-- autotag
	"windwp/nvim-ts-autotag",

	--codecompanion
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	-- avante
	"stevearc/dressing.nvim",
	-- "nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	-- "zbirenbaum/copilot.lua",
	"HakonHarnes/img-clip.nvim",
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false,
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						use_absolute_path = true,
					},
				},
			},
			-- {
			--   'MeanderingProgrammer/render-markdown.nvim',
			--   opts = {
			--     file_types = { "markdown", "Avante" },
			--   },
			--   ft = { "markdown", "Avante" },
			-- },
		},
	},

	-- mcp
	"ravitemer/mcphub.nvim",
	cmd = "MCPHub", -- lazy load by default

	-- img-clip
	"HakonHarnes/img-clip.nvim",

	-- dressing
	"stevearc/dressing.nvim",

	-- plenary
	"nvim-lua/plenary.nvim",

	-- nui
	"MunifTanjim/nui.nvim",

	-- render-markdown
	-- {
	--   'MeanderingProgrammer/render-markdown.nvim',
	--   dependencies = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
	--   opts = {
	--     file_types = { "markdown", "Avante" },
	--   },
	--   ft = { "markdown", "Avante" },
	--   config = function()
	--     require('render-markdown').setup({})
	--   end,
	-- },

	{
		-- "m4xshen/hardtime.nvim",
		-- dependencies = { "MunifTanjim/nui.nvim" },
		-- opts = {},
	},

	-- icon
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},
	-- noice
	"folke/noice.nvim",

  -- live share
	{
		"azratul/live-share.nvim",
		dependencies = {
			"jbyuki/instant.nvim",
		},
		config = function()
			vim.g.instant_username = "your-username"
			require("live-share").setup({
				-- Add your configuration here
			})
		end,
	},

	-- autosave
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({})
		end,
	},

	-- telescope
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
		"BurntSushi/ripgrep",
		"duane9/nvim-rg",
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	-- fzf-lua
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },

	"ray-x/telescope-ast-grep.nvim",

	-- mini
	"echasnovski/mini.pick",
	version = "*",

	"davvid/telescope-git-grep.nvim",

  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
      });
    end
  },

	-- git
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"dinhhuy258/git.nvim",
			"kdheepak/lazygit.nvim",
			"NeogitOrg/neogit",
			"sindrets/diffview.nvim",
		},
	},
	-- comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				--   toggler = {
				--     ---Line-comment toggle keymap
				--     line = 'gcc',
				--     ---Block-comment toggle keymap
				--     block = 'gbc',
				--   },
				--   opleader = {
				--     ---Line-comment keymap
				--     line = 'gc',
				--     ---Block-comment keymap
				--     block = 'gb',
				-- },
			})
		end,
	},
	-- hlchunk
	"shellRaining/hlchunk.nvim",

	-- fm
	"is0n/fm-nvim",

	-- dap
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
	"mxsdev/nvim-dap-vscode-js",
	{
		"microsoft/vscode-js-debug",
		version = "1.x",
		build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
	},
	"microsoft/vscode-js-debug",
	"leoluz/nvim-dap-go",
	"jay-babu/mason-nvim-dap.nvim",
	"mfussenegger/nvim-dap",

	-- comment (duplicate, but preserved as requested)
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- noice (duplicate entry, preserved as requested)
	"folke/noice.nvim",
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",

	-- atac
	{
		"NachoNievaG/atac.nvim",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			require("atac").setup({
				dir = "~/my/work/directory",
			})
		end,
	},
	-- lsp_signature
	"ray-x/lsp_signature.nvim",

	-- rayso
	"ryoppippi/ray-so.vim",

	-- filer
	{
		"lambdalisue/fern.vim",
		dependencies = {
			"lambdalisue/nerdfont.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"stevearc/oil.nvim",
		},
	},

	-- snippy
	"dcampos/nvim-snippy",

	{
		-- neotest
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
	{
		"ptdewey/yankbank-nvim",
		dependencies = "kkharji/sqlite.lua",
		config = function()
			require("yankbank").setup({
				persist_type = "sqlite",
			})
		end,
	},

	-- plenary (duplicate, but preserved as requested)
	"nvim-lua/plenary.nvim",

	-- toggleterm
	"akinsho/toggleterm.nvim",

	-- colorbuddy
	"tjdevries/colorbuddy.vim",

	-- ale
	"w0rp/ale",

	-- copilot
	"github/copilot.vim",
	"nvim-lua/plenary.nvim",
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" },
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	opts = {
		model = "claude-3.7-sonnet",
		debug = true,
	},

	-- autopairs
	"windwp/nvim-autopairs",
	event = "InsertEnter",

	"windwp/nvim-ts-autotag",

	"Shougo/pum.vim",

	{
		"folke/snacks.nvim",
		opts = function()
			-- Toggle the profiler
			Snacks.toggle.profiler():map("<leader>pp")
			-- Toggle the profiler highlights
			Snacks.toggle.profiler_highlights():map("<leader>ph")
		end,
		keys = {
			{
				"<C-j>",
				function()
					Snacks.profiler.scratch()
				end,
				desc = "Profiler Scratch Bufer",
			},
		},
	},
})
