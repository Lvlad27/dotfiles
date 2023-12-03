return {
	-- Appearance
	"rebelot/kanagawa.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
	"norcalli/nvim-colorizer.lua",
	"stevearc/dressing.nvim",
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
	},

	-- Utilities
	{ "folke/which-key.nvim", lazy = true },
	"nvim-tree/nvim-tree.lua",
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"akinsho/bufferline.nvim",
	"rcarriga/nvim-notify",
	"lewis6991/gitsigns.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"sindrets/diffview.nvim",
	"abecodes/tabout.nvim",
	"windwp/nvim-spectre",
	{ "mbbill/undotree", cmd = "UndotreeToggle", lazy = true },
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = { "nvim-lua/plenary.nvim" } },
	"nvim-telescope/telescope-file-browser.nvim",

	-- TreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
			"HiPhish/nvim-ts-rainbow2",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		lazy = true,
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"folke/trouble.nvim",
			"Maan2003/lsp_lines.nvim",
			"ray-x/lsp_signature.nvim",
			"glepnir/lspsaga.nvim",
		},
		lazy = true,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"MunifTanjim/prettier.nvim",
		},
	},

	-- Language specific
}
